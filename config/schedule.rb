
# ENV[‘RAILS_ENV’] = “development”
# :environment

ENV['RAILS_ENV'] = "development"

set :enviroment, 'development'
set :output, "log/whenever.log"
env :GEM_PATH, ENV['GEM_PATH']

# ENV.each { |k, v| env(k, v) }

every :minute do
  rake "api:v1:test_task"
end
