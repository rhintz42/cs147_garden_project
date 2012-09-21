require 'spec_helper'

describe "personal_plant_waterings/new" do
  before(:each) do
    assign(:personal_plant_watering, stub_model(PersonalPlantWatering,
      :watering_time => 1.5,
      :watering_amount => 1.5,
      :personal_plant => nil
    ).as_new_record)
  end

  it "renders new personal_plant_watering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => personal_plant_waterings_path, :method => "post" do
      assert_select "input#personal_plant_watering_watering_time", :name => "personal_plant_watering[watering_time]"
      assert_select "input#personal_plant_watering_watering_amount", :name => "personal_plant_watering[watering_amount]"
      assert_select "input#personal_plant_watering_personal_plant", :name => "personal_plant_watering[personal_plant]"
    end
  end
end
