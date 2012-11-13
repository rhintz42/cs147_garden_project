class PersonalPlantWateringsController < ApplicationController
  include MyModule
  # GET /personal_plant_waterings
  # GET /personal_plant_waterings.json
  def index
    if not check_logged_in then
      return
    end

    @personal_plant = PersonalPlant.find(params[:pp])
    @watering_time = Time.strptime(params[:wt], "%Y-%m-%d").to_f
    @personal_plant_waterings = PersonalPlantWatering.where("personal_plant_id == #{params[:pp]} and watering_time >= #{@watering_time} and watering_time < #{@watering_time+86400}")
    
    @back_url = "/personal_plants/"+@personal_plant[:id].to_s
    @back_label = "Plant"



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_plant_waterings }
    end
  end

  # GET /personal_plant_waterings/1
  # GET /personal_plant_waterings/1.json
  def show
    @personal_plant_watering = PersonalPlantWatering.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_plant_watering }
    end
  end

  # GET /personal_plant_waterings/new
  # GET /personal_plant_waterings/new.json
  def new
    @personal_plant_watering = PersonalPlantWatering.new
    @personal_plant = PersonalPlant.find(params[:pp])
    
    @back_url = "/personal_plant_waterings?pp="+@personal_plant[:id].to_s
    @back_label = "Waterings"


    
    if params[:wt] then
      @has_watering_time = true;
      @watering_time = params[:wt]
      @back_url += CGI.unescapeHTML("&wt="+@watering_time)
    else
      @has_watering_time = false;
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_plant_watering }
    end
  end

  # GET /personal_plant_waterings/1/edit
  def edit
    @personal_plant_watering = PersonalPlantWatering.find(params[:id])
  end

  # POST /personal_plant_waterings
  # POST /personal_plant_waterings.json
  def create


    @personal_plant_watering = PersonalPlantWatering.new(params[:personal_plant_watering])
    
    if /\d{4}-\d{1,2}-\d{1,2}/.match(params[:watering_time]) then
      @personal_plant_watering[:watering_time] = Time.strptime(params[:watering_time], "%Y-%m-%d").to_f
      if params[:mode6].length > 0 then
        @personal_plant_watering[:watering_time] = Time.strptime(params[:watering_time]+"/"+params[:mode6], "%Y-%m-%d/%H:%M").to_f
      end
    else
      @personal_plant_watering[:watering_time] = Time.strptime(params[:watering_time], "%m/%d/%Y").to_f
    end
    @personal_plant_watering[:watering_amount] = params[:watering_amount]

    respond_to do |format|
      if @personal_plant_watering.save
        format.html { redirect_to "/personal_plant_waterings"+"?pp="+@personal_plant_watering.personal_plant[:id].to_s+CGI.unescapeHTML("&wt=")+params[:watering_time], notice: 'Personal plant watering was successfully created.' }
        format.json { render json: "/personal_plant_waterings"+"?pp="+@personal_plant_watering.personal_plant[:id].to_s+CGI.unescapeHTML("&wt=")+params[:watering_time], status: :created, location: @personal_plant_watering }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_plant_watering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_plant_waterings/1
  # PUT /personal_plant_waterings/1.json
  def update
    @personal_plant_watering = PersonalPlantWatering.find(params[:id])

    respond_to do |format|
      if @personal_plant_watering.update_attributes(params[:personal_plant_watering])
        format.html { redirect_to @personal_plant_watering, notice: 'Personal plant watering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @personal_plant_watering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_plant_waterings/1
  # DELETE /personal_plant_waterings/1.json
  def destroy
    @personal_plant_watering = PersonalPlantWatering.find(params[:id])
    @personal_plant_watering.destroy

    respond_to do |format|
      format.html { redirect_to personal_plant_waterings_url }
      format.json { head :no_content }
    end
  end
end
