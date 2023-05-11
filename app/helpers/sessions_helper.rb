module SessionsHelper

  def current_user
    return User.find_by(id: session[:user_id])
  end

  def log_in(user)
    return session[:user_id] = user.id
  end

end