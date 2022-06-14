# frozen_string_literal: true

namespace :cache do
  desc "Clears Rails cache"
  task clear: :environment do ## This will run environment task first and then clear task
    Rails.cache.clear
  end
end
