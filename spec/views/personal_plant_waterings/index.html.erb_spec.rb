require 'spec_helper'

describe "personal_plant_waterings/index" do
  before(:each) do
    assign(:personal_plant_waterings, [
      stub_model(PersonalPlantWatering,
        :watering_time => 1.5,
        :watering_amount => 1.5,
        :personal_plant => nil
      ),
      stub_model(PersonalPlantWatering,
        :watering_time => 1.5,
        :watering_amount => 1.5,
        :personal_plant => nil
      )
    ])
  end

  it "renders a list of personal_plant_waterings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
