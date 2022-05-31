# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

if ENV['DISABLE_BOOTSNAP'] != '1'
  begin
    require 'bootsnap' # Speed up boot time by caching expensive operations.
  rescue LoadError
  end

  if defined? Bootsnap
    Bootsnap.setup(
      cache_dir: 'tmp/cache',
      load_path_cache: true,
      compile_cache_iseq: true,
      compile_cache_yaml: false
    )
  end
end
