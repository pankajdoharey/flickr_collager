namespace :app do
  namespace :test do
    task :collage do
      desc 'Tests collage'
      system 'ruby spec/test_collage.rb'
    end

    task :flickr do
      desc 'Test Flickr Search API'
      system 'ruby spec/test_flickr_search.rb'
    end

    task :magick do
      desc 'Test ImageMagick interface API'
      system 'ruby spec/test_magick_collage.rb'
    end
  end

  namespace :gem do
    task :build do
      desc "Build The Flickr Collager 'gem'."
      system 'gem build flickr_collager.gemspec'
    end
  end

  task all: ['app:test:collage', 'app:test:flickr', 'app:test:magick', 'app:gem:build']
end

desc 'All Tasks'
task default: 'app:all'

desc 'Test Collage'
task 'test:collage' => 'app:test:collage'

desc 'Test Flickr Search API'
task 'test:flickr' => 'app:test:flickr'

desc 'Test ImageMagick inetrface API'
task 'test:magick' => 'app:test:magick'

desc "Build the Flickr Collager 'gem'"
task 'gem:build' => 'app:gem:build'
