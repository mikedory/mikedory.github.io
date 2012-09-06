require 'rubygems'
require 'rake'

# development mode: ENGAGED!
namespace :dev do
    desc 'start this bidness up for local development'
    task :local do
        pid = fork do
            # sh 'jekyll --no-auto --no-server ./src/ ./public/'
            sh 'jekyll --auto --no-server ./src/ ./public/'
        end
        sh 'rackup config.ru -p 5000'
    end
end