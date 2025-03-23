require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  let(:list) { FactoryBot.create(:list, name: "MyList") }
  before(:each) do
    assign(:tasks,
      FactoryBot.create_list(:task, 2,
        subject: "Subject",
        list: list
      )
    )
  end

  it "renders a list of tasks" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Subject".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(1.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 1
    assert_select cell_selector, text: Regexp.new("MyList".to_s), count: 2
  end
end
