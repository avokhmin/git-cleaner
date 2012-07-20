require 'git-cleaner'
require 'rails'
module GitCleaner
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'lib/tasks/git'
    end
  end
end
