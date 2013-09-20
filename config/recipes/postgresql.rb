set_default(:postgresql_host, "localhost")
set_default(:postgresql_user) { application }
set_default(:postgresql_password) { Capistrano::CLI.password_prompt "PostgreSQL Password: " }
set_default(:postgresql_database) { "#{application}_#{rails_env}" }

namespace :postgresql do
  desc "Install the latest stable release of PostgreSQL."
  task :install, roles: :db, only: {primary: true} do
    # Install default postgresql version
    #run "#{sudo} apt-get -y update"
    #run "#{sudo} apt-get -y install postgresql libpq-dev libpq5"

    # Install postgresql 9.2 on Ubuntu 13.04
    run "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' | #{sudo} tee /etc/apt/sources.list.d/pgdg.list > /dev/null"
    run "wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | #{sudo} apt-key add -"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install libpq-dev libpq5"
    run "#{sudo} apt-get -y -t raring install postgresql-common -t raring postgresql-9.2 postgresql-client-9.2"
  end
  after "deploy:install", "postgresql:install"

  desc "Create a database for this application."
  task :create_database, roles: :db, only: {primary: true} do
    run %Q{#{sudo} -u postgres psql -c "create user #{postgresql_user} with password '#{postgresql_password}';"}
    run %Q{#{sudo} -u postgres psql -c "create database #{postgresql_database} owner #{postgresql_user};"}
  end
  after "deploy:setup", "postgresql:create_database"

  desc "Generate the database.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "postgresql.yml.erb", "#{shared_path}/config/database.yml"
  end
  after "deploy:setup", "postgresql:setup"

  desc "Symlink the database.yml file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "postgresql:symlink"
end
