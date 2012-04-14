require 'bundler/capistrano'
require 'delayed/recipes'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "homeworkio"
set :repository,  "git@github.com:lfborjas/homeworkio.git"
set :scm, :git
set :deploy_via, :remote_cache
set :user, "deploy"
set :password, "8ac2356f" #same for postgresroot

#Server IP: 97.107.142.7
server "homeworkio.com", :app, :web, :db, :primary => true
set :branch, "master"
set :rails_env, "production"


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end

 task :symlink_shared do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
 end
end

after "deploy:update_code", "deploy:symlink_shared"
after "deploy:update_code" do
  run "cd #{release_path}; bundle exec rake RAILS_ENV=production assets:precompile"
end

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"
