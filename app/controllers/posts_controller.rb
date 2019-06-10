class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index]

  def index

  end

  def new
    
  end

  def create
    
  end

  private

  def logged_in_user
    unless logged_in?
      redirect_to login_path
    end 
  end
end
