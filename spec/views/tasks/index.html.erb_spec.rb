require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        subject: "Subject",
        position: 2,
        list: nil
      ),
      Task.create!(
        subject: "Subject",
        position: 2,
        list: nil
      )
    ])
  end

  it "renders a list of tasks" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Subject".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
