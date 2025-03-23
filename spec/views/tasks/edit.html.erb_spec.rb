require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  let(:task) {
    FactoryBot.create(:task,
      subject: "MyString",
      position: 1,
    )
  }

  before(:each) do
    assign(:task, task)
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(task), "post" do

      assert_select "input[name=?]", "task[subject]"

      assert_select "input[name=?]", "task[position]"

      assert_select "select[name=?]", "task[list_id]"
    end
  end
end
