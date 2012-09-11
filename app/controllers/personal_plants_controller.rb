class PersonalPlantsController < ApplicationController
  # GET /personal_plants
  # GET /personal_plants.json
  def index
    @personal_plants = PersonalPlant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_plants }
    end
  end

  # GET /personal_plants/1
  # GET /personal_plants/1.json
  def show
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
    @plant_id = params[:plant_id]
    @plant = Plant.new
    @personal_plant = PersonalPlant.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_plant }
    end
  end

  # GET /personal_plants/1/edit
  def edit
    @personal_plant = PersonalPlant.find(params[:id])
  end

  # POST /personal_plants
  # POST /personal_plants.json
  def create
    @personal_plant = PersonalPlant.new(params[:personal_plant])

    respond_to do |format|
      if @personal_plant.save
        format.html { redirect_to @personal_plant, notice: 'Personal plant was successfully created.' }
        format.json { render json: @personal_plant, status: :created, location: @personal_plant }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_plants/1
  # PUT /personal_plants/1.json
  def update
    @personal_plant = PersonalPlant.find(params[:id])

    respond_to do |format|
      if @personal_plant.update_attributes(params[:personal_plant])
        format.html { redirect_to @personal_plant, notice: 'Personal plant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @personal_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_plants/1
  # DELETE /personal_plants/1.json
  def destroy
    @personal_plant = PersonalPlant.find(params[:id])
    @personal_plant.destroy

    respond_to do |format|
      format.html { redirect_to personal_plants_url }
      format.json { head :no_content }
    end
  end
end
