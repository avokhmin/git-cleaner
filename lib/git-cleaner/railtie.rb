module GitCleaner
  class GitCleanerRailtie < Rails::Railtie
    rake_tasks do
      load "tasks/git.rake"
    end
  end
end
