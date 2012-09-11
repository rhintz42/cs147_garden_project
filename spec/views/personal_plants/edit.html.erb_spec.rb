require 'spec_helper'

describe "personal_plants/edit" do
  before(:each) do
    @personal_plant = assign(:personal_plant, stub_model(PersonalPlant,
      :name_personalized => "MyString",
      :plant => nil
    ))
  end

  it "renders the edit personal_plant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => personal_plants_path(@personal_plant), :method => "post" do
      assert_select "input#personal_plant_name_personalized", :name => "personal_plant[name_personalized]"
      assert_select "input#personal_plant_plant", :name => "personal_plant[plant]"
    end
  end
end
