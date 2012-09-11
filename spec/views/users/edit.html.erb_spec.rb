require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name_first => "MyString",
      :name_middle => "MyString",
      :name_last => "MyString",
      :password => "MyString",
      :username => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name_first", :name => "user[name_first]"
      assert_select "input#user_name_middle", :name => "user[name_middle]"
      assert_select "input#user_name_last", :name => "user[name_last]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_email", :name => "user[email]"
    end
  end
end
