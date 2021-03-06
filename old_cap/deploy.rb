## Generated with 'brightbox' on 2012-03-13 16:12:26 +0000
gem 'brightbox', '>=2.3.9'
require 'capistrano/ext/multistage'
require 'brightbox/recipes'
require 'brightbox/passenger'

set :default_stage, 'staging'

load 'deploy/assets'

set :application, "bip"
set :rake, 'bundle exec rake' #atm asset compilation fails without this
# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

# Target directory for the application on the web and app servers.
set(:deploy_to) { File.join("", "home", user, application) }

# URL of your source repository. By default this will just upload
# the local directory.  You should probably change this if you use
# another repository, like git or subversion.

set :repository,  "git@github.com:unepwcmc/BIP-Indicators-page.git"
set :scm, :git
set :scm_username, "unepwcmc-read"

### Other options you can set ##
# Comma separated list of additional domains for Apache
# set :domain_aliases, "www.example.com,dev.example.com"

## Dependencies
# Set the commands and gems that your application requires. e.g.
# depend :remote, :gem, "will_paginate", ">=2.2.2"
# depend :remote, :command, "brightbox"
#
# If you're using Bundler, then you don't need to specify your
# gems here as well as there (and the bundler gem is installed for
# you automatically)
# 
# Gem with a source (such as github)
# depend :remote, :gem, "tmm1-amqp", ">=0.6.0", :source => "http://gems.github.com"
# 
# Specify your specific Rails version if it is not vendored
# depend :remote, :gem, "rails", "=2.2.2"
#
# Set the apt packages your application or gems require. e.g.
# depend :remote, :apt, "libxml2-dev"

## Local Shared Area
# These are the list of files and directories that you want
# to share between the releases of your application on a particular
# server. It uses the same shared area as the log files.
#
# NOTE: local areas trump global areas, allowing you to have some
# servers using local assets if required.
#
# So if you have an 'upload' directory in public, add 'public/upload'
# to the :local_shared_dirs array.
# If you want to share the database.yml add 'config/database.yml'
# to the :local_shared_files array.
#
# The shared area is prepared with 'deploy:setup' and all the shared
# items are symlinked in when the code is updated.
# set :local_shared_dirs, %w(public/upload)
# set :local_shared_files, %w(config/database.yml)

set :local_shared_files, %w(config/database.yml db/production.sqlite3)

## Global Shared Area
# These are the list of files and directories that you want
# to share between all releases of your application across all servers.
# For it to work you need a directory on a network file server shared
# between all your servers. Specify the path to the root of that area
# in :global_shared_path. Defaults to the same value as :shared_path.
# set :global_shared_path, "/srv/share/myapp"
#
# NOTE: local areas trump global areas, allowing you to have some
# servers using local assets if required.
#
# Beyond that it is the same as the local shared area.
# So if you have an 'upload' directory in public, add 'public/upload'
# to the :global_shared_dirs array.
# If you want to share the database.yml add 'config/database.yml'
# to the :global_shared_files array.
#
# The shared area is prepared with 'deploy:setup' and all the shared
# items are symlinked in when the code is updated.
# set :global_shared_dirs, %w(public/upload)
# set :global_shared_files, %w(config/database.yml)

# SSL Certificates. If you specify an SSL certificate name then
# the gem will create an 'https' configuration for this application
# TODO: Upload and install the keys on the server
# set :ssl_certificate, "/path/to/certificate/for/my_app.crt"
# set :ssl_key, "/path/to/key/for/my_app.key
# or
# set :ssl_certificate, "name_of_installed_certificate"

## Static asset caching.
# By default static assets served directly by the web server are
# cached by the client web browser for 10 years, and cache invalidation
# of static assets is handled by the Rails helpers using asset
# timestamping.
# You may need to adjust this value if you have hard coded static
# assets, or other special cache requirements. The value is in seconds.
# set :max_age, 315360000

# SSH options. The forward agent option is used so that loopback logins
# with keys work properly
# ssh_options[:forward_agent] = true

# Forces a Pty so that svn+ssh repository access will work. You
# don't need this if you are using a different SCM system. Note that
# ptys stop shell startup scripts from running.
default_run_options[:pty] = true

## Logrotation
# Where the logs are stored. Defaults to <shared_path>/log
# set :log_dir, "central/log/path"
# The size at which to rotate a log. e.g 1G, 100M, 5M. Defaults to 100M
# set :log_max_size, "100M"
# How many old compressed logs to keep. Defaults to 10
# set :log_keep, "10"

## Version Control System
# Which version control system. Defaults to subversion if there is
# no 'set :scm' command.
# set :scm, :git
# set :scm_username, "rails"
# set :scm_password, "mysecret"
# or be explicit
# set :scm, :subversion

## Deployment settings
# The brightbox gem deploys as the user 'rails' by default and
# into the 'production' environment. You can change these as required.
# set :user, "rails"
# set :rails_env, :production

## Command running settings
# use_sudo is switched off by default so that commands are run
# directly as 'user' by the run command. If you switch on sudo
# make sure you set the :runner variable - which is the user the
# capistrano default tasks use to execute commands.
# NB. This just affects the default recipes unless you use the
# 'try_sudo' command to run your commands.
set :use_sudo, true
set :runner, "rails"## Passenger Configuration
# Set the method of restarting passenger
# Defaults to :hard which is used to instantly free up database connections
# :soft uses the standard touch tmp/restart.txt which leaves database connections
# lingering until the workers time out
# set :passenger_restart_strategy, :hard

#after "deploy:create_symlink", "deploy:restart_workers"
#after "deploy:restart_workers", "deploy:restart_scheduler"

##
# Rake helper task.
# http://pastie.org/255489
# http://geminstallthat.wordpress.com/2008/01/27/rake-tasks-through-capistrano/
# http://ananelson.com/said/on/2007/12/30/remote-rake-tasks-with-capistrano/

task :setup_production_database_configuration do
  require 'yaml'

  spec = {
    "#{rails_env}" => {
      "adapter" => "sqlite3",
      "database" => "db/#{rails_env}.sqlite3",
      "pool" => 5,
      "timeout" => 5000
    }
  }

  run "mkdir -p #{shared_path}/config"
  put(spec.to_yaml, "#{shared_path}/config/database.yml")
end
after "deploy:setup", :setup_production_database_configuration

