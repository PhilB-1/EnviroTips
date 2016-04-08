get '/sms' do
  erb :send_sms
end

post '/sms' do
  tip = Tips.find(rand(1..(Tips.all.length)))
  msg = "Envirotip:" + tip


  @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  @message = @client.messages.create(
    to: "+13235733073",
    from: "+15103533275",
    body: msg
  )
end