# bundler
require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/memcached"
load "config/recipes/rbenv"
load "config/recipes/check"

# application
set :application, "codegyver"

# server
default_run_options[:pty] = true
default_run_options[:shell] = '/bin/bash --login'
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
set :user, "deploy"
set :use_sudo, false
set :deploy_to, "/home/#{user}/apps/#{application}"

# repository
set :scm, :git
set :repository, "git@bitbucket.org:zpieslak/codegyver.git"

# server
server "193.17.184.218", :app, :web, :db, :primary => true
set :rails_env, 'production'
set :branch, 'master'
set :server_name, 'codegyver.net'

# clean old releases
set :keep_releases, 3
after "deploy:update", "deploy:cleanup"
