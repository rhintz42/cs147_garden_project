class PersonalPlantsController < ApplicationController
  
  include MyModule
  #include #{Rails.root}/lib/modules/my_module.rb

  # GET /personal_plants
  # GET /personal_plants.json
  def index
    #This shows how to create new things of these correctly
    #@user = User.new
    #@user.user_comments.build

    #@plant = Plant.new
    #@plant.plant_comments.build
    
    #@personal_plants = PersonalPlant.new
    #@personal_plants.personal_plant_comments.build
    
    #debugger
    #@user = User.new
    #@user.user_messages.build

    if not check_logged_in then
      return
    end
    @personal_plants = PersonalPlant.where(:user_id => session[:user][:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_plants }
    end
  end

  # GET /personal_plants/1
  # GET /personal_plants/1.json
  def show
    if not check_logged_in then
      return
    end
    @personal_plant = PersonalPlant.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_plant }
    end
  end
  
  # GET /personal_plants/options
  # GET /personal_plants/options.json
  def options
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: '' }
    end
  end
  
  
  # GET /personal_plants/new
  # GET /personal_plants/new.json
  def new
    if not check_logged_in then
      return
    end

    if params[:plants] then
      @plant = Plant.find(JSON.parse(params[:plants])[0])
    else
      @plant = Plant.new
    end

    @plant_id = params[:plant_id]
    
    @plant.personal_plants.build
    @plant.personal_plants[0].personal_plant_waterings.build
    
    @plants = Plant.all
    
    #@a = render_to_string action: "options"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_plant }
    end
  end

  # GET /personal_plants/1/edit
  def edit
    if not check_logged_in then
      return
    end   
    
    @personal_plant = PersonalPlant.find(params[:id])
  end

  # POST /personal_plants
  # POST /personal_plants.json
  def create
    if not check_logged_in then
      return
    end
    @plant = Plant.new(params[:plant])
    
    respond_to do |format|
      if @plant.save
        format.html { redirect_to @plant.personal_plant, notice: 'Personal plant was successfully created.' }
        format.json { render json: @plant.personal_plant, status: :created, location: @personal_plant }
      else
        format.html { render action: "new" }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
    
    #@personal_plant = PersonalPlant.new(params[:personal_plant])

    #respond_to do |format|
    #  if @personal_plant.save
    #    format.html { redirect_to @personal_plant, notice: 'Personal plant was successfully created.' }
    #    format.json { render json: @personal_plant, status: :created, location: @personal_plant }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @personal_plant.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PUT /personal_plants/1
  # PUT /personal_plants/1.json
  def update
    if not check_logged_in then
      return
    end
    @personal_plant = PersonalPlant.find(params[:id])
    
    respond_to do |format|
      if @personal_plant.update_attributes(params[:personal_plant])
        format.html { redirect_to @personal_plant, notice: 'Personal plant was successfully updated.' }
        format.json { head :no_content } else
        format.html { render action: "edit" }
        format.json { render json: @personal_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_plants/1
  # DELETE /personal_plants/1.json
  def destroy
    if not check_logged_in then
      return
    end
    @personal_plant = PersonalPlant.find(params[:id])
    @personal_plant.destroy

    respond_to do |format|
      format.html { redirect_to personal_plants_url }
      format.json { head :no_content }
    end
  end
end
