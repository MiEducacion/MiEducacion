# lib/update.rb

module MiEducacion
    module Updater
        

      def self.remote_version
        remote_hash = `git ls-remote --heads origin main`.strip.split.first
        remote_hash
      end

      def self.updates_available?
        MiEducacion.git_version != remote_version
      end

      def self.versions_diff  
        commits = `git rev-list #{ MiEducacion.git_version}..#{remote_version}`
  
        commits.split("\n").count
      end

  
      def self.log(message)
        publish 'log', message + "\n"
      end

      def self.publish(type, value)
        MessageBus.publish("/admin/upgrade",
          { type: type, value: value },
          user_ids: [@user_id]
        )
      end

      def self.percent(val)
        publish('percent', val)
      end

      def self.run_update

        percent(0)

        log("********************************************************")
        log("*** Please be patient, next steps might take a while ***")
        log("********************************************************")

        percent(10)


        run("git pull")
        percent(25)

        run("bundle install")

        percent(50)

        run("rake db:migrate")

        percent(65)


        percent(80)

        log("*** Bundling assets. This will take a while *** ")

        run("rake assets:precompile")

        percent(100)

        FileUtils.touch(Rails.root.join("tmp/restart.txt"))
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
    
        unless retval == 0
          STDERR.puts("FAILED: '#{cmd}' exited with a return value of #{retval}")
          STDERR.puts(msg)
          raise RuntimeError
        end
      end
  
      private

    
      def self.recompile_assets
        # Implementa la lógica para recompilar los assets
        system("rails assets:precompile")

      end
  
      def self.run_migrations
        # Implementa la lógica para ejecutar las migraciones
        system("rake db:migrate")
      end
  
      def self.restart_server
        # Implementa la lógica para reiniciar el servidor
        system("rails restart")
      end
    end
  end
  