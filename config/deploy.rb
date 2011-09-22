# Variable per app
set :user, "ubuntu"
set :domain, "ec2-50-16-236-221.compute-1.amazonaws.com"
set :application, "topout"
set :rails_env, "production"
set :keep_releases, 2

# File paths
set :repository,  "#{user}@#{domain}:git/#{application}.git"
set :deploy_to, "/home/#{user}/topout.com"

role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db,  domain, :primary => true       # This is where Rails migrations will run

# you might need to set this if you aren't seeing password prompts
default_run_options[:pty] = true

set :deploy_via, :remote_cache
set :scm, "git"
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :rvm_type, :user

set :default_environment, {
  'PATH' => "/home/ubuntu/.rvm/gems/ruby-1.9.2-p180@top_out/bin:/home/ubuntu/.rvm/gems/ruby-1.9.2-p180@global/bin:/home/ubuntu/.rvm/rubies/ruby-1.9.2-p180/bin:/home/ubuntu/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
  'RUBY_VERSION' => '1.9.2p180',
  'GEM_HOME'     => '/home/ubuntu/.rvm/gems/ruby-1.9.2-p180@top_out',
  'GEM_PATH'     => '/home/ubuntu/.rvm/gems/ruby-1.9.2-p180@top_out:/home/ubuntu/.rvm/gems/ruby-1.9.2-p180@global',
  'BUNDLE_PATH'  => '/home/ubuntu/.rvm/gems/ruby-1.9.2-p180@top_out'  # If you are using bundler.
}

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end 

desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install --without test development"
end

# after "deploy:update_code", "rvm:trust_rvmrc"
after "deploy:update_code", :bundle_install
after "deploy:update", "deploy:cleanup" 

# Might need the following?
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
