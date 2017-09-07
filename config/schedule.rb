set :output, "log/cron_log.log"
env :PATH, ENV['PATH']

every 1.minute do
	runner "Log.method_to_schedule"
end