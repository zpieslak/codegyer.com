def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

def add_apt_repository(repo)
  run "#{sudo} add-apt-repository #{repo}", :pty => true do |ch, stream, data|
    if data =~ /Press.\[ENTER\].to.continue/
      ch.send_data("\n")
    else
      Capistrano::Configuration.default_io_proc.call(ch, stream, data)
    end
  end
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties software-properties-common imagemagick libmagickwand-dev"
    #run "export LANGUAGE=en_US.UTF-8"
    #run "export LANG=en_US.UTF-8"
    #run "export LC_ALL=en_US.UTF-8"
    run "#{sudo} locale-gen en_US.UTF-8"
    run "#{sudo} dpkg-reconfigure locales"
  end

  task :cold do # Overriding the default deploy:cold
    update
    load_schema # My own step, replacing migrations.
    start
  end

  task :load_schema, :roles => :app do
    run "cd #{current_path}; bundle exec rake db:schema:load RAILS_ENV=#{rails_env}"
  end

  desc "Invoke rake task"
  task :invoke do
    run "cd '#{current_path}' && #{rake} #{ENV['task']} RAILS_ENV=#{rails_env}"
  end
end

namespace :tools do
  desc "tail log files"
  task :log, :roles => :app do
    run "tail -f #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts "#{channel[:host]}: #{data}"
      break if stream == :err
    end
  end
end
