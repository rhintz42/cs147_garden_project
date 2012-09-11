require 'spec_helper'

describe "plants/index" do
  before(:each) do
    assign(:plants, [
      stub_model(Plant,
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
      ),
      stub_model(Plant,
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
      )
    ])
  end

  it "renders a list of plants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Common".to_s, :count => 2
    assert_select "tr>td", :text => "Name Botanical".to_s, :count => 2
    assert_select "tr>td", :text => "Plant Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
