require 'rubygems'
require 'rake'
require 'sass'
require 'barista'

# by default, build and serve locally
task :default => 'local:serve'

# development mode: ENGAGED!
namespace :local do

    desc 'start this bidness up for local development'
    task :dev do
        fork do
            sh 'jekyll --auto --no-server ./src/ ./public/'
        end
        fork do
           sh 'sass --watch ./src/static/css/style.scss:src/static/css/style.css'
        end
        fork do
            sh 'coffee -w -o ./src/static/js -c ./src/static/js'
        end
        sh 'rackup config.ru -p 5000'
    end

    desc 'serve locally'
    task :serve do
        sh 'jekyll --no-auto --no-server ./src/ ./public/'
        sh 'rackup config.ru -p 5000'
    end

end

# all the fancy heroku options
namespace :heroku do

    desc 'build and export the coffee (and make one file of it all)'
    task :coffee do
        file "./public/static/js/script.js" => Dir['./static/js/*.coffee'] do |t|
            Rake::Task["bistro_car"].invoke
        end
    end    

    desc "Generate the cached bundle/default.js file from app/scripts/*.coffee files"
    task :bistro_car => :environment do
        path = "./public/static/js/script.js"
        puts "Building *.coffee -> #{path}"
        File.open(path, "w") { |file| file << BistroCar::Bundle.new('default').to_javascript }
    end


    desc 'build and export the sass'
    task :sass do
        sh 'sass --update ./src/static/css/style.scss:src/static/css/style.css'
    end    

    desc 'serve on heroku'
    task :serve => [:coffee, :sass] do
        sh 'jekyll --no-auto --no-server ./src/ ./public/'
        sh 'bundle exec thin start -p $PORT -e $RACK_ENV'
    end

end