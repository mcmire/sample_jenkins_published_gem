
namespace :about do
  def project; YourGem; end
  def project_path; 'your_gem'; end

  task :name do
    require File.expand_path("../../lib/#{project_path}/name", __FILE__)
    puts project.name
  end

  task :version do
    require File.expand_path("../../lib/#{project_path}/version", __FILE__)
    puts project.version
  end

  task :version_file do
    require File.expand_path("../../lib/#{project_path}/version", __FILE__)
    puts project.version_file
  end
end
