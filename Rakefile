namespace :app do
  namespace :test do
    task :collage do
      desc "Tests collage"
      system "ruby spec/test_collage.rb"
    end

    task :flickr do
      desc "Test Flickr Search API"
      system "ruby spec/test_flickr_search.rb"
    end
  end

  task :all => ['app:test:collage', 'app:test:flickr']
end

desc "All Tasks"
task :default => 'app:all'

desc "Test Collage"
task 'test:collage' => 'app:test:collage'

desc "Test Flickr Search API"
task 'test:flickr' => 'app:test:flickr'
