namespace :unicorn do
  desc 'restart unicorn'
  task :restart do
    `kill -USR2 $(cat tmp/pids/unicorn.pid)`
  end

  desc 'stop unicorn'
  task :stop do
    `kill -QUIT $(cat tmp/pids/unicorn.pid)`
  end

  desc 'start unicorn'
  task :start do
    `unicorn_rails -D -c config/unicorn.rb`
  end
end
