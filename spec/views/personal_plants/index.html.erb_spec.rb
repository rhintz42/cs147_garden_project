require 'spec_helper'

describe "personal_plants/index" do
  before(:each) do
    assign(:personal_plants, [
      stub_model(PersonalPlant,
        :name_personalized => "Name Personalized",
        :plant => nil
      ),
      stub_model(PersonalPlant,
        :name_personalized => "Name Personalized",
        :plant => nil
      )
    ])
  end

  it "renders a list of personal_plants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Personalized".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
