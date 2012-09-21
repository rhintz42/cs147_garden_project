module MyModule

  def check_logged_in
    if not session[:user] then
      session['previous_page'] = request.fullpath
      redirect_to login_users_path, notice: 'Need to log in before you can do that'
      return false
    end
    return true
  end

end
