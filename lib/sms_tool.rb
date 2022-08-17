module SmsTool
  def self.send_sms(number:, message:) 
    puts "sending sms #{message}"
    puts "to #{number}"
  end
end