require 'rubygems'
require 'rake'

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
        sh 'coffee -j ./src/static/js/script.js -c ./src/static/js/*.coffee'
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