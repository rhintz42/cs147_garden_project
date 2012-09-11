require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name_first => "Name First",
      :name_middle => "Name Middle",
      :name_last => "Name Last",
      :password => "Password",
      :username => "Username",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name First/)
    rendered.should match(/Name Middle/)
    rendered.should match(/Name Last/)
    rendered.should match(/Password/)
    rendered.should match(/Username/)
    rendered.should match(/Email/)
  end
end
