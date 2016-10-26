get '/users/new' do
	erb :'users/new'
end

post '/users' do
	user = User.new(params[:user])

	if user.save
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@errors = user.errors.full_messages
		p @errors
		erb :'users/new'
	end
end

get '/users/:user_id' do
	@user = User.find(params[:user_id])
	erb :'users/show'
end

get '/users/:user_id/edit' do
	@user = User.find(params[:user_id])
	erb :'users/edit'
end

put '/users/:user_id' do
	@user = User.find(params[:user_id])
	@user.update_attributes(params[:user])

	if @user.save
		redirect '/'
	else
		erb :'users/edit'
	end
end




