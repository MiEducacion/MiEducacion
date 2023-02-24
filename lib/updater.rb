# lib/update.rb

require "io/wait"

module MiEducacion
  module Updater
    def self.remote_version
      `git ls-remote --heads origin main`.strip.split.first
    end

    def self.versions_diff
      commits = `git rev-list #{MiEducacion.git_version}..#{remote_version}`

      commits.split("\n").count
    end

    def self.updates_available?
      MiEducacion.git_version != remote_version # temporarily
    end

    def self.last_commit_message
      `git log --format=%s -n 1`
    end

    def self.log(message)
      publish "log", message + "\n"
    end

    def self.publish(type, value)
      MessageBus.publish("/admin/upgrade",
                         { type:, value: },
                         user_ids: [@user_id])
    end

    def self.percent(val)
      publish("percent", val)
    end

    def self.run_update
      pid = Process.pid

      MiEducacion.maintenance_enabled = true


      percent(0)

      log("********************************************************")
      log("*** MiEducación Update - This may take a few minutes ***")
      log("********************************************************")
      log("")

      log("=> Puma PID: #{pid}")
      log("=> Current git hash: #{MiEducacion.git_version}")
      log("=> Remote git hash: #{MiEducacion::Updater.remote_version}")
      log("=> Commit message: #{Mieducacion::Updater.last_commit_message}")

      percent(5)
      log("")
      log("************** Enabling Maintenance Mode ***************")
      log("")
      percent(10)


      run("git pull")
      percent(25)

      run("bundle install")

      percent(30)
      run("yarn install --production")

      percent(50)

      run("rake db:migrate")

      percent(65)


      percent(80)

      log("*** Bundling assets. This will take a while *** ")

      run("rake assets:precompile")

      percent(92)
      log("************** Disabling Maintenance Mode ***************")

      percent(100)

      log("DONE")
      publish("status", "complete")
      MiEducacion.maintenance_enabled = false

      FileUtils.touch(Rails.root.join("tmp/restart.txt"))
      system("kill -USR2 #{pid}")
    rescue StandardError => e
      publish("status", "failed")
      MiEducacion.maintenance_enabled = false

      [
        "FAILED TO UPGRADE",
        e.inspect,
        e.backtrace.join("\n")
      ].each do |message|
        warn(message)
        log(message)
      end
    end

    def self.run(cmd)
      log "$ #{cmd}"
      msg = +""





      retval = nil
      Open3.popen2e("cd #{Rails.root} && #{cmd} 2>&1") do |_in, out, wait_thread|
        out.each do |line|
          line.rstrip! # the client adds newlines, so remove the one we're given
          log(line)
          msg << line << "\n"
        end
        retval = wait_thread.value
      end

      return if retval == 0

      warn("FAILED: '#{cmd}' exited with a return value of #{retval}")
      warn(msg)
      MiEducacion.maintenance_enabled = false
      raise RuntimeError
    end
  end
end
