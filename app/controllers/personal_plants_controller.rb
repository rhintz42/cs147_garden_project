class PersonalPlantsController < ApplicationController
  
  include MyModule
  #include #{Rails.root}/lib/modules/my_module.rb

  # GET /personal_plants
  # GET /personal_plants.json
  def index
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

    #debugger

    

    @personal_plant_watering = PersonalPlantWatering.new

    @personal_plant = PersonalPlant.find(params[:id])
    @personal_plant_waterings = PersonalPlantWatering.where(:personal_plant_id => @personal_plant[:id]).order('watering_time ASC')
    
    #debugger

    @back_url = "/gardens/"+@personal_plant.garden[:id].to_s
    @back_label = "Garden"
    
    @plant_comments = PlantComment.where(:plant_id => @personal_plant.plant.id)

    @personal_plant_waterings_by_date = {}
    #@personal_plant_waterings_by_date[Time.now().to_date - 2] = [PersonalPlant.new] 
    
    waterings_for_date = @personal_plant_waterings
    
    waterings_for_date.each do |watering|
      date = Time.at(watering[:watering_time]).to_date

      if @personal_plant_waterings_by_date[date] then
        @personal_plant_waterings_by_date[date] << @personal_plant
      else
        @personal_plant_waterings_by_date[date] = [@personal_plant]
      end
    end
    
    @water_frequency = (3)*60*60*24 #Need to change to the actual watering frequency
    
    if @personal_plant_waterings.size > 0 then
      @next_watering = Time.at(@personal_plant_waterings[@personal_plant_waterings.size-1][:watering_time] + @water_frequency).to_date
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_plant }
    end
  end
  
  # GET /personal_plants/s/1
  # GET /personal_plants/s/1.json

  ######TAKE OUT
  def show2
    if not check_logged_in then
      return
    end


    @personal_plant_watering = PersonalPlantWatering.new
    
    @personal_plant = PersonalPlant.find(params[:id])
    @personal_plant_waterings = PersonalPlantWatering.where(:personal_plant_id => @personal_plant[:id])
    
    @back_url = "/gardens/"+@personal_plant.garden[:id].to_s
    @back_label = "Garden"

    @personal_plant_waterings_by_date = {}
    #@personal_plant_waterings_by_date[Time.now().to_date - 2] = [PersonalPlant.new] 
    
    waterings_for_date = @personal_plant_waterings
    
    waterings_for_date.each do |watering|
      date = Time.at(watering[:watering_time]).to_date

      if @personal_plant_waterings_by_date[date] then
        @personal_plant_waterings_by_date[date] << @personal_plant
      else
        @personal_plant_waterings_by_date[date] = [@personal_plant]
      end
    end


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
    
    ###NEED TO SEE WHAT THIS IS FOR
    if params[:plants] then
      @plant = Plant.find(JSON.parse(params[:plants])[0])
    else
      @plant = Plant.new
    end
    
    @garden_id = params[:garden_id]
    @plant_id = params[:plant_id]
    
    #@plant.personal_plants.build
    #@plant.personal_plants[0].personal_plant_waterings.build
    
    @plants = Plant.all
    @personal_plant = PersonalPlant.new
    @personal_plant[:garden_id] = @garden_id
    @personal_plant[:plant_id] = @plant_id
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
    
    @garden_id = @personal_plant[:garden_id]
    @plant_id = @personal_plant[:plant_id]

    @plants = Plant.where(:id => @personal_plant[:plant_id])
  end

  # POST /personal_plants
  # POST /personal_plants.json
  def create
    if not check_logged_in then
      return
    end

    @personal_plant = PersonalPlant.new(params[:personal_plant])
    
    respond_to do |format|
      if @personal_plant.save
        format.html { redirect_to "/gardens/"+@personal_plant.garden[:id].to_s, notice: 'Personal plant was successfully created.' }
        format.json { render json: "/gardens/"+@personal_plant.garden[:id].to_s, status: :created, location: @personal_plant }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_plants/1
  # PUT /personal_plants/1.json
  def update
    if not check_logged_in then
      return
    end

    @personal_plant = PersonalPlant.find(params[:id])

    session[:reload] = true
    
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
