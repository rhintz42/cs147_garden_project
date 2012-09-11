require 'spec_helper'

describe "personal_plants/show" do
  before(:each) do
    @personal_plant = assign(:personal_plant, stub_model(PersonalPlant,
      :name_personalized => "Name Personalized",
      :plant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Personalized/)
    rendered.should match(//)
  end
end
