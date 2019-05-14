require 'rubygems'
require 'rake'
require 'rdoc/task'
# require 'activesupport'
namespace :api do
  namespace :v1 do
    desc "TEST"
    task test_task: :environment do
      puts "Hello, I am cron working at #{Time.now}"
    end
  end
end
