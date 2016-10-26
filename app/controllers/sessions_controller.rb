get '/sessions/login' do

	erb :'sessions/login'
end

post '/sessions' do
	user = User.authenticate(params[:user])
	if user
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@error = "Email and/or password is incorrect"
		erb :'sessions/login'
	end
end



delete '/sessions' do
	session[:user_id] = nil
	redirect '/'
end