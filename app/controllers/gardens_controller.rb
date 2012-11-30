class GardensController < ApplicationController

  include MyModule
  
  # GET /gardens
  # GET /gardens.json
  def index
    if not check_logged_in then
      return
    end
    @gardens = Garden.where(:user_id => session[:user][:id])
    @user = User.where(:id => session[:user][:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gardens }
    end
  end

  # GET /gardens/1
  # GET /gardens/1.json
  def show
    if not check_logged_in then
      return
    end
    @garden = Garden.find(params[:id])
    @plants_in_garden = PersonalPlant.where(:garden_id => @garden[:id] )

    @back_url = gardens_path
    @back_label = "My Gardens"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @garden }
    end
  end

  # GET /gardens/new
  # GET /gardens/new.json
  def new
    if not check_logged_in then
      return
    end
    @garden = Garden.new
    
    @back_url = gardens_path
    @back_label = "My Gardens"
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @garden }
    end
  end

  # GET /gardens/1/edit
  def edit
    if not check_logged_in then
      return
    end
    @garden = Garden.find(params[:id])
  end

  # POST /gardens
  # POST /gardens.json
  def create
    if not check_logged_in then
      return
    end
    @garden = Garden.new(params[:garden])
    @garden[:user_id] = session[:user][:id]

    respond_to do |format|
      if @garden.save
        if session[:user][:default_garden_id] == nil then
          @user = User.find(session[:user][:id])

          if @user[:default_garden_id] == nil then
            @user[:default_garden_id] = @garden[:id]
            if @user.save(:validate => false) then
              #do nothing
            end
          end
          session[:user] = @user
        end

        format.html { redirect_to gardens_path, notice: 'Garden was successfully created.' }
        format.json { render json: gardens_path, status: :created, location: @garden }
      else
        format.html { render action: "new" }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gardens/1
  # PUT /gardens/1.json
  def update
    if not check_logged_in then
      return
    end
    @garden = Garden.find(params[:id])

    respond_to do |format|
      if @garden.update_attributes(params[:garden])
        format.html { redirect_to @garden, notice: 'Garden was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gardens/1
  # DELETE /gardens/1.json
  def destroy
    if not check_logged_in then
      return
    end
    @garden = Garden.find(params[:id])
    @garden.destroy

    respond_to do |format|
      format.html { redirect_to gardens_url }
      format.json { head :no_content }
    end
  end
end
