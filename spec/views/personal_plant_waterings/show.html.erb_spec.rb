require 'spec_helper'

describe "personal_plant_waterings/show" do
  before(:each) do
    @personal_plant_watering = assign(:personal_plant_watering, stub_model(PersonalPlantWatering,
      :watering_time => 1.5,
      :watering_amount => 1.5,
      :personal_plant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(//)
  end
end
