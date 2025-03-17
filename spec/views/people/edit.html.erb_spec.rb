require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  let(:person) {
    Person.create!(
      sn: "MyString",
      givenname: "MyString",
      username: "MyString",
      city: "MyString",
      active: false,
      category: nil
    )
  }

  before(:each) do
    assign(:person, person)
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(person), "post" do

      assert_select "input[name=?]", "person[sn]"

      assert_select "input[name=?]", "person[givenname]"

      assert_select "input[name=?]", "person[username]"

      assert_select "input[name=?]", "person[city]"

      assert_select "input[name=?]", "person[active]"

      assert_select "select[name=?]", "person[category_id]"
    end
  end
end
