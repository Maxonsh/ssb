server 'staging.sellitswapitbuyit.com', :roles => %w(app web db)

set :stage, 'staging'
set :deploy_to, '/home/deployer/ssb.cifronomika.ru'

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :rvm_ruby_version, `cat .ruby-version`.strip

append :linked_files, '.env.staging', 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/pids'

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
