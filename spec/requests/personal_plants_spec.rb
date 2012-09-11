require 'spec_helper'

describe "PersonalPlants" do
  describe "GET /personal_plants" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get personal_plants_path
      response.status.should be(200)
    end
  end
end
