require "bundler/capistrano"
require "capistrano-cook"

server "176.58.102.156", :app, :web, :db, :primary => true

set :domain,      "cphrb.subsis.dk"
set :rails_env,   :production
set :branch,      "master"

# Overrides default db (MySQL).
set :db_server,   :postgresql

set :application, "ffcrm"
set :user,        "cphrb" # The server's user for deploys

set :scm,         "git"
set :repository,  "git@github.com:subsis/capistrano-cook-demo.git"

set :deploy_to,   "/var/www/#{application}"
set :deploy_via,  :remote_cache

set :use_sudo,    true

default_run_options[:pty]   = true # Must be set for the password prompt from git to work
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
