namespace :memcached do
  desc "Install the latest relase of Memcached (http://memcached.org/)"
  task :install, roles: :app do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install memcached"
  end
  after "deploy:install", "memcached:install"

  desc "start memcached"
  task :start, roles: :web do
    run "#{sudo} nohup /etc/init.d/memcached start"
  end

  desc "stop memcached"
  task :stop, roles: :web do
    run "#{sudo} killall -s TERM memcached; true"
  end

  desc "restart memcached"
  task :restart, roles: :web do
    memcached.stop
    sleep(3)  # sleep for 3 seconds to make sure the server has mopped up everything
    memcached.start
  end
end
