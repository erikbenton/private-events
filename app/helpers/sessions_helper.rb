module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
		@current_user = user
	end

	def logged_in?
		!current_user.nil?
	end

	def logout
		session[:user_id] = nil
		@current_user = nil
	end

	def current_user
		if(user_id = session[:user_id])
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end


end
