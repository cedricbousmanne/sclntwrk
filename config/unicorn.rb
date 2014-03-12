worker_processes 2
preload_app true
timeout 30
listen 3000
pid File.join(File.dirname(__FILE__), "../tmp/pids/unicorn.pid")


after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
