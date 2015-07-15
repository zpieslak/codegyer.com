# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'codegyver'
set :user, ENV.fetch('SERVER_USER')
set :repo_url, ENV.fetch('SERVER_REPO_URL')

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/application.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp', 'public/assets')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Rbenv configuration
set :rbenv_ruby, File.read('.ruby-version').strip

# Bundler options
set :bundle_path, -> { nil }
set :bundle_flags, nil

# Whenever
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
