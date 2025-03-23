require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      sn: "MyString",
      givenname: "MyString",
      username: "MyString",
      city: "MyString",
      active: false,
      category: nil
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[sn]"

      assert_select "input[name=?]", "person[givenname]"

      assert_select "input[name=?]", "person[username]"

      assert_select "input[name=?]", "person[city]"

      assert_select "input[name=?]", "person[active]"

      assert_select "select[name=?]", "person[category_id]"
    end
  end
end
