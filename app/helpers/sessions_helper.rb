helpers do
	def current_user
		if User.exists?(session[:user_id])
			@current_user = User.find(session[:user_id])
		end
	end

	def logged_in?
		current_user
	end
end