require 'spec_helper'

describe "GardenWaterings" do
  describe "GET /garden_waterings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get garden_waterings_path
      response.status.should be(200)
    end
  end
end
