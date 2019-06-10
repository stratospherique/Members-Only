module SessionsHelper
  
  def remember(user)
    user.remember
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def forget(user)
    cookies.delete(:user_id)
    cookies.delete(:remember_digest)
  end

  def current_user
    if session[:user_id] 
      user = User.find(session[:user_id])
    elsif cookies[:user_id]
      user = User.find(cookies[:user_id])
    else
      user = nil
    end
  end
end