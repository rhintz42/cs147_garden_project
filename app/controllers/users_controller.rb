class UsersController < ApplicationController
  
  include MyModule
  
  # GET /users
  # GET /users.json
  def index
    if not check_logged_in then
      return
    end
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if not check_logged_in then
      return
    end
    @user = User.find_by_id(params[:id])
    @gardens = Garden.where(:user_id => params[:id])
    @plants = PersonalPlant.where(:user_id => params[:id])

    
    #debugger

    if @user == nil then
      session[:user] = nil
      respond_to do |format|
        format.html { redirect_to home_index_path }# show.html.erb
        format.json { render json: @user }
      end
      return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/login
  # GET /users/login.json
  def login
    if session[:user] != nil then
      logged_in_home_page = home_index_path
      respond_to do |format|
        format.html { redirect_to logged_in_home_page}
        format.json { head :no_content }
      end
      return
    end

    @user = User.new
    
    respond_to do |format|
      format.html # login.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users/login/1
  # POST /users/login/1.json
  def login_post
    @user = User.find_by_username(params[:user][:username])
    
    if @user == nil or not @user.password_valid?(params[:user][:password]) then
      respond_to do |format|
        format.html { redirect_to login_users_path, notice: "Either the username or password is invalid. Please try again."}
        format.json { head :no_content }
      end
      return
    else
      session[:user] = @user

      if session[:previous_page] then
        respond_to do |format| 
          session[:no_back] = true
          format.html { redirect_to session[:previous_page] }
          format.json { head :no_content }
        end

        session[:previous_page] = nil
        return
      end
      
      logged_in_home_page = users_path + '/' +  session[:user][:id].to_s
      respond_to do |format|
        format.html { redirect_to gardens_path}
        format.json { head :no_content }
      end
      return
    end
  end

  def logout
    session[:user] = nil
    
    respond_to do |format|
      format.html { redirect_to login_users_path, notice: 'Logged Out' }
      format.json { render json: login_users_path }
    end
  end


  # GET /users/new
  # GET /users/new.json
  def new

    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new2
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if not check_logged_in then
      return
    end
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    
    if @user.username_exists? then
      @user.errors.add(:username, "Username Exists")
    end
    respond_to do |format|
      if @user.save
        session[:user] = @user
        session[:no_back] = true

        format.html { redirect_to gardens_path, notice: 'User was successfully created.' }
        format.json { render json: gardens_path, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    if not check_logged_in then
      return
    end
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if not check_logged_in then
      return
    end
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
