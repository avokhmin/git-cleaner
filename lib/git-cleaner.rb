module GitCleaner

  def self.load_tasks
    Dir[File.expand_path("tasks/*.rake", File.dirname(__FILE__))].each { |ext| load ext }
  end

  require 'git-cleaner/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  
end
