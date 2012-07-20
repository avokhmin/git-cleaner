require 'git-cleaner'
require 'rails'

module GitCleaner
  class Railtie < Rails::Railtie

    rake_tasks do
      GitCleaner.load_tasks
    end

  end
end
