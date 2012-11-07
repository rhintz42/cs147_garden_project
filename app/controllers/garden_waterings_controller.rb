class GardenWateringsController < ApplicationController
  # GET /garden_waterings
  # GET /garden_waterings.json
  def index
    @garden_waterings = GardenWatering.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @garden_waterings }
    end
  end

  # GET /garden_waterings/1
  # GET /garden_waterings/1.json
  def show
    @garden_watering = GardenWatering.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @garden_watering }
    end
  end

  # GET /garden_waterings/new
  # GET /garden_waterings/new.json
  def new
    @garden_watering = GardenWatering.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @garden_watering }
    end
  end

  # GET /garden_waterings/1/edit
  def edit
    @garden_watering = GardenWatering.find(params[:id])
  end

  # POST /garden_waterings
  # POST /garden_waterings.json
  def create
    @garden_watering = GardenWatering.new(params[:garden_watering])

    respond_to do |format|
      if @garden_watering.save
        format.html { redirect_to @garden_watering, notice: 'Garden watering was successfully created.' }
        format.json { render json: @garden_watering, status: :created, location: @garden_watering }
      else
        format.html { render action: "new" }
        format.json { render json: @garden_watering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /garden_waterings/1
  # PUT /garden_waterings/1.json
  def update
    @garden_watering = GardenWatering.find(params[:id])

    respond_to do |format|
      if @garden_watering.update_attributes(params[:garden_watering])
        format.html { redirect_to @garden_watering, notice: 'Garden watering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @garden_watering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garden_waterings/1
  # DELETE /garden_waterings/1.json
  def destroy
    @garden_watering = GardenWatering.find(params[:id])
    @garden_watering.destroy

    respond_to do |format|
      format.html { redirect_to garden_waterings_url }
      format.json { head :no_content }
    end
  end
end
