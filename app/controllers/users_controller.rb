class UsersController < ApplicationController
  before_action :current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:session] = @user.id
      redirect_to root_path, notice: "Welcome! #{@user.email}"
    else
      render :new
    end
  end

  def destroy
    session[:session] = nil
    redirect_to root_path, notice: "Log out!"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end