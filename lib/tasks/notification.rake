namespace :notification do
  desc "Sends SMS notification to employees asking to log if they had overtime or not."
  task sms: :environment do
    #schedule to send every sunday 5pm
    # iterate over employees 
    # skip Admin users
    # send a msg that has instructio ns and and a link 
  end
end
