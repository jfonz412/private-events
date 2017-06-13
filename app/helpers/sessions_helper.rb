module SessionsHelper

	# sessions are usually destroyed on browser exit
  def log_in(user)
  	# session method from rails takes care of things for us
  	session[:user_id] = user.id
  end

  # checks session for a user id
  # this method is called in logged_in? to check if we are logged in
	def current_user
		if (user_id = session[:user_id]) # if you can put an id here
			current_user ||= User.find_by(id: user_id)
		end
	end

	def logged_in?
		!current_user.nil?
	end
end
