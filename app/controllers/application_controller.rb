class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  def current_user
    if session[:session]
      @user = User.find(session[:session])
      redirect_to posts_path
    end
  end
end
