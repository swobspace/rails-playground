require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        sn: "Sn",
        givenname: "Givenname",
        username: "u0001",
        city: "City",
        active: false,
        category: nil
      ),
      Person.create!(
        sn: "Sn",
        givenname: "Givenname",
        username: "u0002",
        city: "City",
        active: false,
        category: nil
      )
    ])
  end

  it "renders a list of people" do
    render
    # puts rendered
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Sn".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Givenname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("u0001".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("u0002".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
