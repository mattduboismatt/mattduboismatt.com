# http://robmclarty.com/blog/how-to-deploy-a-rails-4-app-with-git-and-capistrano

set :rbenv_ruby, '2.0.0-p247'

# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'mattduboismatt.com'
set :repo_url, 'git@github.com:mattduboismatt/mattduboismatt.com.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/mattduboismatt.com'

# Default value for :scm is :git
set :scm, :git

set :user, 'mattduboismatt'
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5
# default_run_options[:pty] = true
server "www.mattduboismatt.com", roles: [:app, :web, :db], :primary => true

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
