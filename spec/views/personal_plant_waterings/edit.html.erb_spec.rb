require 'spec_helper'

describe "personal_plant_waterings/edit" do
  before(:each) do
    @personal_plant_watering = assign(:personal_plant_watering, stub_model(PersonalPlantWatering,
      :watering_time => 1.5,
      :watering_amount => 1.5,
      :personal_plant => nil
    ))
  end

  it "renders the edit personal_plant_watering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => personal_plant_waterings_path(@personal_plant_watering), :method => "post" do
      assert_select "input#personal_plant_watering_watering_time", :name => "personal_plant_watering[watering_time]"
      assert_select "input#personal_plant_watering_watering_amount", :name => "personal_plant_watering[watering_amount]"
      assert_select "input#personal_plant_watering_personal_plant", :name => "personal_plant_watering[personal_plant]"
    end
  end
end
