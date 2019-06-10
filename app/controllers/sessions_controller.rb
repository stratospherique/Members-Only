
class SessionsController < ApplicationController
  
  
  def new
    
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      # Log the user in and redirect to the user's show page.
      
      log_in(user)
      remember user
      redirect_to posts_path
    else
      render 'new'
    end
  end


  def destroy
    user = current_user
    log_out(user)
    forget user
    redirect_to login_path
  end

  private

    def log_in(user)
      current_user = user
    end

    def log_out(user)
      if user == current_user
        session.delete(:user_id)
      end
    end

end