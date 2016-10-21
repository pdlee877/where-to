get '/users' do
	erb :'users/index'
end

get '/users/new' do
	erb :'users/new'
end

post '/users' do
	user = User.new(params[:user])

	if user.save
		session[:user_id] = user.id
		redirect '/users'
	else
		@errors = user.errors.full_messages
		p @errors
		erb :'users/new'
	end
end

get '/users/:user_id' do
	
end