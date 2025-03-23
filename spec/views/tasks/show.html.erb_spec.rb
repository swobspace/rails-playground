require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  let(:list) { FactoryBot.create(:list, name: "MyList") }
  before(:each) do
    assign(:task, FactoryBot.create(:task,
      subject: "Subject",
      position: 2,
      list_id: list.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyList/)
  end
end
