class HomeController < ApplicationController
  def index
    if session[:user] then
      logged_in_user_home_page = users_path + '/' + session[:user][:id].to_s
      respond_to do |format|
        format.html { redirect_to logged_in_user_home_page }
      end
      return
    end
    @current_time = Time.now
  end
end
