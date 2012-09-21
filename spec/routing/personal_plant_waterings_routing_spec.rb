require "spec_helper"

describe PersonalPlantWateringsController do
  describe "routing" do

    it "routes to #index" do
      get("/personal_plant_waterings").should route_to("personal_plant_waterings#index")
    end

    it "routes to #new" do
      get("/personal_plant_waterings/new").should route_to("personal_plant_waterings#new")
    end

    it "routes to #show" do
      get("/personal_plant_waterings/1").should route_to("personal_plant_waterings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/personal_plant_waterings/1/edit").should route_to("personal_plant_waterings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/personal_plant_waterings").should route_to("personal_plant_waterings#create")
    end

    it "routes to #update" do
      put("/personal_plant_waterings/1").should route_to("personal_plant_waterings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/personal_plant_waterings/1").should route_to("personal_plant_waterings#destroy", :id => "1")
    end

  end
end
