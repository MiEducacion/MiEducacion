# frozen_string_literal: true

module MiEducacion
  class Application < Rails::Application
    unless defined? ::MiEducacion::Version
      module Version
        MAJOR = 0
        MINOR = 0
        TINY  = 9
        PRE   = "alpha"

        FULL = [MAJOR, MINOR, TINY, PRE].compact.join(".")
      end
    end
  end
end
