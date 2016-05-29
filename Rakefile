namespace :app do
  namespace :test do
    task :collage do
      desc "Tests collage"
      system "ruby spec/test_collage.rb"
    end
  end

  task :all => ['app:test:collage']
end

desc "All Tasks"
task :default => 'app:all'

