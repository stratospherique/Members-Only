
class ApplicationController < ActionController::Base
  include SessionsHelper
  def remember(user)
    user.remember
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def forget(user)
    cookies.delete(:user_id)
    cookies.delete(:remember_digest)
  end
  
end
