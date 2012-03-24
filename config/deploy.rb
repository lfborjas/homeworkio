require 'bundler/capistrano'

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

namespace :mailman do
  desc "Mailman::Start"
  task :start, :roles => [:app] do
    run "cd #{current_path};RAILS_ENV=#{rack_env} bundle exec script/mailman_daemon start"
  end
  
  desc "Mailman::Stop"
  task :stop, :roles => [:app] do
    run "cd #{current_path};RAILS_ENV=#{rack_env} bundle exec script/mailman_daemon stop"
  end
  
  desc "Mailman::Restart"
  task :restart, :roles => [:app] do
    mailman.stop
    mailman.start
  end
end

before "deploy:restart", "mailman:stop"
after  "deploy:restart", "mailman:start"

after "deploy:update_code", "deploy:symlink_shared"
after "deploy:update_code" do
  run "cd #{release_path}; bundle exec rake RAILS_ENV=production assets:precompile"
end

