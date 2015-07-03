# Directories
work_dir = '/home/deploy/apps/codegyver/current/'
socket_path = '/tmp/unicorn.codegyver.sock'
pid_path = "#{work_dir}tmp/pids/unicorn.pid"
stderr_path = "#{work_dir}log/unicorn.stderr.log"
stdout_path = "#{work_dir}log/unicorn.stdout.log"

working_directory work_dir
worker_processes 2
timeout 30
listen socket_path
pid pid_path
stderr_path stderr_path
stdout_path stdout_path
preload_app true

before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = "#{work_dir}Gemfile"
end

before_fork do |server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!

  # Quit the old unicorn process
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
