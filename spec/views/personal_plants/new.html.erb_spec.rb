require 'spec_helper'

describe "personal_plants/new" do
  before(:each) do
    assign(:personal_plant, stub_model(PersonalPlant,
      :name_personalized => "MyString",
      :plant => nil
    ).as_new_record)
  end

  it "renders new personal_plant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => personal_plants_path, :method => "post" do
      assert_select "input#personal_plant_name_personalized", :name => "personal_plant[name_personalized]"
      assert_select "input#personal_plant_plant", :name => "personal_plant[plant]"
    end
  end
end
