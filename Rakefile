require 'rubygems'
require 'rake'

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
        sh 'rackup config.ru -p 5000'
    end

    desc 'serve locally'
    task :serve do
        sh 'jekyll --no-auto --no-server ./src/ ./public/'
        sh 'rackup config.ru -p 5000'
    end

end

# development mode: ENGAGED!
namespace :herkou do

    desc 'serve on heroku'
    task :serve do
        sh 'jekyll --no-auto --no-server ./src/ ./public/'
        sh 'bundle exec thin start -p $PORT -e $RACK_ENV'
    end

end