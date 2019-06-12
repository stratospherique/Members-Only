class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(article_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:post).permit(:title, :body)
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_path
    end 
  end
end
