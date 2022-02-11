class ApplicationController < ActionController::Base
  def current_user
    if session[:session]
      @user = User.find(session[:session])
      return redirect_to posts_path
    end
  end
end
