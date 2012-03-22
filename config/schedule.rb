set :output, "log/cron_log.log"

every 1.day, :at => '0:00 am' do 
  rake "showroom:update"
end
