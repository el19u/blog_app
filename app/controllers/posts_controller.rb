class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy if @post
    redirect_to root_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :author, :content)
  end

  def find_params
    @post = Post.find(params[:id])
  end
end
