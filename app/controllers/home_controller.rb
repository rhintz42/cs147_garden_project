class HomeController < ApplicationController
  def index
    #debugger
    #t = Time.now
    
    if session[:user] then
      logged_in_user_home_page = gardens_path
      respond_to do |format|
        format.html { redirect_to gardens_path }
      end
      return
    else
      respond_to do |format|
        format.html { redirect_to users_login_path }#logout_users_path }
      end
    end

    @current_time = Time.now
  end
end
