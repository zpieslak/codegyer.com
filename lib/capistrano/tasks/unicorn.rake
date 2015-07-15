namespace :unicorn do
  desc 'Reload application'
  task :upgrade do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, 'unicorn_codegyver', 'upgrade'
    end
  end
end

after 'deploy:published', 'unicorn:upgrade'
