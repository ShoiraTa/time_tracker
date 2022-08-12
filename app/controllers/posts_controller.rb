class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def show
    @post = Post.find(params[:id])
  end

  def create
    if @post.save
      redirect_to @post
    end
  end

  private
  def post_params 
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.new(post_params)
  end
end
