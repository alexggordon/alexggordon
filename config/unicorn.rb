# config/unicorn.rb

# Set the working application directory
# working_directory '/path/to/your/app'
app_directory = '/var/www/alexggordon.com/current'


working_directory app_directory
# Path to logs
# stderr_path '/path/to/log/unicorn.log'
# stdout_path '/path/to/log/unicorn.log'
stdout_path '/var/www/alexggordon.com/shared/log/unicorn.log'
stderr_path '/var/www/alexggordon.com/shared/log/unicorn.log'

listen '/var/sockets/unicorn.alexggordon.socket', :backlog => 1024

# Number of processes
# worker_processes 4
worker_processes 1

# Time-out
timeout 30

File.umask(027)

# config/unicorn/staging.rb
app_path = '/var/www/alexggordon.com/'
 
preload_app        true
timeout            180
user               'deploy'
pid                "#{app_path}shared/tmp/pids/unicorn.pid"

if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end
 
before_fork do |server, worker|
  ##
  # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
  # immediately start loading up a new version of itself (loaded with a new
  # version of our app). When this new Unicorn is completely loaded
  # it will begin spawning workers. The first worker spawned will check to
  # see if an .oldbin pidfile exists. If so, this means we've just booted up
  # a new Unicorn and need to tell the old one that it can now die. To do so
  # we send it a QUIT.
  #
  # Using this method we get 0 downtime deploys.
 
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
  # the following is recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end
end
 
after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end

