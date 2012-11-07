require 'spec_helper'

describe "garden_waterings/new" do
  before(:each) do
    assign(:garden_watering, stub_model(GardenWatering,
      :watering_amount => 1.5,
      :watering_time => 1.5,
      :personal_plant => nil
    ).as_new_record)
  end

  it "renders new garden_watering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => garden_waterings_path, :method => "post" do
      assert_select "input#garden_watering_watering_amount", :name => "garden_watering[watering_amount]"
      assert_select "input#garden_watering_watering_time", :name => "garden_watering[watering_time]"
      assert_select "input#garden_watering_personal_plant", :name => "garden_watering[personal_plant]"
    end
  end
end
