namespace :pages do
  desc 'Runs page cache'
  task :cache_all do
    on roles(:app) do
      info '[deploy:cache_all] Running pages:cache_all'
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'pages:cache_all'
        end
      end
    end
  end
end

after 'deploy:finished', 'pages:cache_all'
