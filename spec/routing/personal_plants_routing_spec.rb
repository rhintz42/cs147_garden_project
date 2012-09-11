require "spec_helper"

describe PersonalPlantsController do
  describe "routing" do

    it "routes to #index" do
      get("/personal_plants").should route_to("personal_plants#index")
    end

    it "routes to #new" do
      get("/personal_plants/new").should route_to("personal_plants#new")
    end

    it "routes to #show" do
      get("/personal_plants/1").should route_to("personal_plants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/personal_plants/1/edit").should route_to("personal_plants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/personal_plants").should route_to("personal_plants#create")
    end

    it "routes to #update" do
      put("/personal_plants/1").should route_to("personal_plants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/personal_plants/1").should route_to("personal_plants#destroy", :id => "1")
    end

  end
end
