namespace :unicorn do
  desc 'Start application'
  task :start do
    on roles(:app) do
      execute :sudo, :service, 'unicorn', 'start'
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      execute :sudo, :service, 'unicorn', 'stop'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute :sudo, :service, 'unicorn', 'restart'
    end
  end

  desc 'Reload application'
  task :upgrade do
    on roles(:app), in: :sequence, wait: 20 do
      execute :sudo, :service, 'unicorn', 'upgrade'
    end
  end
end

after 'deploy:published', 'unicorn:upgrade'
