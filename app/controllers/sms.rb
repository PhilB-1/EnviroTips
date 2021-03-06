get '/sms' do
  erb :send_sms
end

post '/sms' do
  tip = Tip.find(rand(1..(Tip.count)))
  msg = "Envirotip: #{tip.title}-#{tip.description}"


  @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

  @message = @client.messages.create({
    to: "+13235733073",
    from: "+15103533275",
    body: msg
  })

  redirect '/'
end