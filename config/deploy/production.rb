## Generated with 'brightbox' on 2011-08-24 13:56:07 +0100
gem 'brightbox', '>=2.3.9'
require 'brightbox/recipes'
require 'brightbox/passenger'

# Primary domain name of your application. Used in the Apache configs
set :domain, "unepwcmc-013.vm.brightbox.net"

## List of servers
server "unepwcmc-013.vm.brightbox.net", :app, :web, :db, :primary => true

set :branch, "master"

## Robots.txt to prevent google from indexing staging
task :no_index_robots do
  run "echo 'User-Agent: *' > #{current_path}/public/robots.txt"
  run "echo 'Disallow: /' >> #{current_path}/public/robots.txt"
end

after "deploy", :no_index_robots
