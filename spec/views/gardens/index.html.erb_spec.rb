require 'spec_helper'

describe "gardens/index" do
  before(:each) do
    assign(:gardens, [
      stub_model(Garden,
        :name => "Name"
      ),
      stub_model(Garden,
        :name => "Name"
      )
    ])
  end

  it "renders a list of gardens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
