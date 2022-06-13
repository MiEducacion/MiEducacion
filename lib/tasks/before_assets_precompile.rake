# frozen_string_literal: true

task :before_assets_precompile do
  # Test: Export translations before precompiling assets
  system("bundle exec rake i18n:js:export")
end

# every time execute 'rake assets:precompile'
# run 'before_assets_precompile' first
Rake::Task["assets:precompile"].enhance ["before_assets_precompile"]
