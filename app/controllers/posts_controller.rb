class PostsController < ApplicationController
  caches_page :index, :show

  def index
    @title = 'Our Blog'
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  def show
    @post = Post.find params[:id]
    @title = @post.title
  end
end
