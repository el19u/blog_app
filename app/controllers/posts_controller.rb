class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(:id)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @posts }
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      respond_to do |format|
        format.html { render :index, notice: "Post was successfully created." }
        format.json { render json: :show, status :created }
      end
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
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
  def post_params
    params.require(:post).permit(:title, :author, :content)
  end

  def find_params
    @post = Post.find(params[:id])
  end
end
