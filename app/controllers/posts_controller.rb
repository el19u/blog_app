class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(:id)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy if @post
    redirect_to posts_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :author, :content)
  end

  def find_params
    @post = Post.find(params[:id])
  end
end
