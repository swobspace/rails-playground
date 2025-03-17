require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    assign(:person, Person.create!(
      sn: "Sn",
      givenname: "Givenname",
      username: "Username",
      city: "City",
      active: false,
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sn/)
    expect(rendered).to match(/Givenname/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
