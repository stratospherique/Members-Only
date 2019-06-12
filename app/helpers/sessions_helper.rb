module SessionsHelper

  def current_user
    if session[:user_id] 
      user = User.find(session[:user_id])
    elsif cookies[:user_id]
      user = User.find(cookies[:user_id])
    else
      user = nil
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user=(user)
    session[:user_id] = user.id
    current_user=current_user
  end
end