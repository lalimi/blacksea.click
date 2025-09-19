# Puma configuration file for BlackSea production

# The directory to operate out of.
directory '/var/www/blacksea'

# Use "path" as the file to store the server info state. This is
# used by "pumactl" to query and control the server.
state_path '/var/www/blacksea/tmp/pids/puma.state'

# Redirect STDOUT and STDERR to files.
stdout_redirect '/var/www/blacksea/log/puma.stdout.log', '/var/www/blacksea/log/puma.stderr.log', true

# The minimum number of threads to use to answer requests.
# The default is "0".
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the `worker_timeout` threshold that Puma will use to wait before
# terminating a worker in development environments.
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
workers ENV.fetch("WEB_CONCURRENCY") { ENV.fetch("PUMA_WORKER_PROCESSES") { 1 } }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Bind to unix socket for nginx
bind 'unix:///var/www/blacksea/tmp/sockets/puma.sock'

# Daemonize the server into the background. Highly suggest that
# this be combined with "pidfile" and "stdout_redirect".
daemonize false

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
