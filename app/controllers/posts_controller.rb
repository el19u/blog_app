class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  private
  def posts_params
    params.require(:posts).permit(:title, :author, :content)
  end
end
