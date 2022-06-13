# frozen_string_literal: true

require_dependency "version"

module MiEducacion
  def self.git_version
    @git_version ||= begin
        git_cmd = "git rev-parse HEAD"
        self.try_git(git_cmd, MiEducacion::Application::Version::FULL)
      end
  end

  def self.git_branch
    @git_branch ||= begin
        git_cmd = "git rev-parse --abbrev-ref HEAD"
        self.try_git(git_cmd, "unknown")
      end
  end

  def self.try_git(git_cmd, default_value)
    version_value = false

    begin
      version_value = `#{git_cmd}`.strip
    rescue
      version_value = default_value
    end

    if version_value.empty?
      version_value = default_value
    end

    version_value
  end

  class Utils
  end
end
