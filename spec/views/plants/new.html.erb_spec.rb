require 'spec_helper'

describe "plants/new" do
  before(:each) do
    assign(:plant, stub_model(Plant,
      :name_common => "MyString",
      :name_botanical => "MyString",
      :plant_type => "MyString",
      :water_weekly => 1.5,
      :water_frequency => 1.5,
      :recommended_sun_exposure => "",
      :actual_sun_exposure => "",
      :is_houseplant => "",
      :last_watering => 1.5,
      :next_watering => 1.5,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new plant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plants_path, :method => "post" do
      assert_select "input#plant_name_common", :name => "plant[name_common]"
      assert_select "input#plant_name_botanical", :name => "plant[name_botanical]"
      assert_select "input#plant_plant_type", :name => "plant[plant_type]"
      assert_select "input#plant_water_weekly", :name => "plant[water_weekly]"
      assert_select "input#plant_water_frequency", :name => "plant[water_frequency]"
      assert_select "input#plant_recommended_sun_exposure", :name => "plant[recommended_sun_exposure]"
      assert_select "input#plant_actual_sun_exposure", :name => "plant[actual_sun_exposure]"
      assert_select "input#plant_is_houseplant", :name => "plant[is_houseplant]"
      assert_select "input#plant_last_watering", :name => "plant[last_watering]"
      assert_select "input#plant_next_watering", :name => "plant[next_watering]"
      assert_select "textarea#plant_description", :name => "plant[description]"
    end
  end
end
