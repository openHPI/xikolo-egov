# frozen_string_literal: true

preload_app true
timeout ENV.fetch('UNICORN_TIMEOUT', 60).to_i

worker_processes ENV.fetch('WORKER', 1).to_i

before_fork do |server, _worker|
  ActiveRecord::Base.connection.disconnect!
  Msgr.client.stop

  old_pid = "#{server.pid}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |_server, _worker|
  ActiveRecord::Base.establish_connection
end
