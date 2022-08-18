module SmsTool
  account_sid= ENV['TWILLIO_ACCOUNT_SID']
  auth_token= ENV['TWILLIO_AUTH_TOKEN']

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  def self.send_sms(number:, message:) 
    @client.messages.create(
      from: ENV['TWILLIO_PHONE_NUMBER'],
      to: "+#{number}",
      body: "#{message}"
    )
  end
end

# SmsTool.send_sms(number: '995551113368', message: 'Hello from overtime app')