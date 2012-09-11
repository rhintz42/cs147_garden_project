require 'spec_helper'

describe "plants/show" do
  before(:each) do
    @plant = assign(:plant, stub_model(Plant,
      :name_common => "Name Common",
      :name_botanical => "Name Botanical",
      :plant_type => "Plant Type",
      :water_weekly => 1.5,
      :water_frequency => 1.5,
      :recommended_sun_exposure => "",
      :actual_sun_exposure => "",
      :is_houseplant => "",
      :last_watering => 1.5,
      :next_watering => 1.5,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Common/)
    rendered.should match(/Name Botanical/)
    rendered.should match(/Plant Type/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
  end
end
