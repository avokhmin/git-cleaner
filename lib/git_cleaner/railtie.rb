require 'git-cleaner'
require 'rails'
module GitCleaner
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'lib/tasks/git.rake'
    end
  end
end
