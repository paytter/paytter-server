namespace :unicorn do
  desc 'Starting Unicorn'
  task :start do
    config_path = Rails.root.join 'config', 'unicorn', "#{Rails.env}.rb"
    sh "bundle exec unicorn -c #{config_path} -E #{Rails.env} -D"
  end

  desc 'Stopping Unicorn'
  task(:stop) { unicorn_signal :QUIT }

  desc 'Restarting Unicorn'
  task(:restart) { unicorn_signal :USR2 }

  def unicorn_signal(signal)
    Process.kill signal, unicorn_pid
  end

  def unicorn_pid
    File.read("#{ENV.fetch('app_path')}/shared/tmp/pids/unicorn.pid").to_i
  rescue Errno::ENOENT
    raise "Unicorn doesn't seem to be running"
  end
end
