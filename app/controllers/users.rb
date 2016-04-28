get '/users/new' do
  if request.xhr?
    return erb :"users/new", {layout: false}
  else
    erb :"users/new"
  end
end

post '/users' do
  if request.xhr?
    User.create(request.params[:user])
  else
    User.create(params[:user])
    redirect '/'
  end
end

get '/sessions/new' do
  @errors = params[:errors]
  erb :"sessions/new"
end

post '/sessions' do
  # print params[:email]
  # print params[:password_hash]
  # print "*****"
  if User.authenticate(params[:email], params[:password])
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    session[:email] = user.email
    redirect '/'
  else
    redirect '/sessions/new?errors=Your email or password entered were incorrect.'
  end
end

get'/sessions/clear' do
  session.clear
  redirect '/'
end