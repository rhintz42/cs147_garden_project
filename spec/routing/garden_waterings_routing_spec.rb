require "spec_helper"

describe GardenWateringsController do
  describe "routing" do

    it "routes to #index" do
      get("/garden_waterings").should route_to("garden_waterings#index")
    end

    it "routes to #new" do
      get("/garden_waterings/new").should route_to("garden_waterings#new")
    end

    it "routes to #show" do
      get("/garden_waterings/1").should route_to("garden_waterings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/garden_waterings/1/edit").should route_to("garden_waterings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/garden_waterings").should route_to("garden_waterings#create")
    end

    it "routes to #update" do
      put("/garden_waterings/1").should route_to("garden_waterings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/garden_waterings/1").should route_to("garden_waterings#destroy", :id => "1")
    end

  end
end
