namespace :doc do
  Rake::RDocTask.new(:rdoc_dev) do |rd|
    rd.main = "README.doc"
    rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
    rd.options << "--all"
  end
end