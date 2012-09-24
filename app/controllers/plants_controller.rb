class PlantsController < ApplicationController
  include MyModule
    
  # GET /plants
  # GET /plants.json
  def index
    
    @plants = Plant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plants }
    end
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
    @plant = Plant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plant }
    end
  end

  # GET /plants/new
  # GET /plants/new.json
  def new
    if not check_logged_in then
      return
    end

    @plant = Plant.new
    
    @created_from_user = false
    if params[:came_from] then
      @created_from_user = true
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plant }
    end
  end

  # GET /plants/1/edit
  def edit
    if not check_logged_in then
      return
    end
    @plant = Plant.find(params[:id])
  end

  # POST /plants
  # POST /plants.json
  def create
    if not check_logged_in then
      return
    end
    
    #debugger
    
    if params[:plant][:id] then
      @personal_plant = PersonalPlant.new(params[:plant][:personal_plants_attributes]["0"])
      #params[:plant][:personal_plants_attributes]["0"]
      @personal_plant[:plant_id] = params[:plant][:id]
      respond_to do |format|
        if @personal_plant.save
          format.html { redirect_to @personal_plant, notice: 'Personal plant was successfully created.' }
          format.json { render json: @personal_plant, status: :created, location: @personal_plant }
        else
          format.html { render controller: "personal_plant", action: "new" }
          format.json { render json: @personal_plant.errors, status: :unprocessable_entity }
        end
      end
    else
      @plant = Plant.new(params[:plant])
    
      #debugger
      #@plant.personal_plants[0].save
      respond_to do |format|
        if @plant.save
          #I BELIEVE THIS GO_TO IS NOT RELEVENT ANYMORE, BUT NOT SURE
          @go_to = @plant

          if @plant[:created_from_user] then
            @go_to = new_personal_plant_path + '?plant_id=' + @plant[:id].to_s
          end

          format.html { redirect_to @go_to, notice: 'Plant was successfully created.' }
          format.json { render json: @plant, status: :created, location: @plant }
        else
          format.html { render action: "new" }
          format.json { render json: @plant.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /plants/1
  # PUT /plants/1.json
  def update
    if not check_logged_in then
      return
    end

    @plant = Plant.find(params[:id])

    respond_to do |format|
      if @plant.update_attributes(params[:plant])
        format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    if not check_logged_in then
      return
    end
    @plant = Plant.find(params[:id])
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to plants_url }
      format.json { head :no_content }
    end
  end
end
