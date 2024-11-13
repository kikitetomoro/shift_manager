
set :output, "./log/cron.log"
require File.expand_path(File.dirname(__FILE__) + '/environment')
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env



# 毎日0:00に実行する
every 1.day, at: '00:00' do
    runner "ShiftSetting.find_each { |setting| setting.send_emails if setting.send_date == Date.today.day }"
    runner "ShiftSetting.find_each { |setting| setting.send_reminder_emails if setting.remind_date == Date.today.day }"
    runner "ShiftSetting.check_shift"
  end



