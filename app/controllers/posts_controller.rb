class PostsController < ApplicationController
  caches_page :index, :show

  def index
    @posts = Post.order("created_at DESC").page params[:page]
  end

  def show
    @post = Post.find params[:id]
  end
end
