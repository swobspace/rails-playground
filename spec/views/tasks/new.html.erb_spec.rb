require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, FactoryBot.build(:task,
      subject: "MyString",
      position: 1,
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[subject]"

      assert_select "input[name=?]", "task[position]"

      assert_select "select[name=?]", "task[list_id]"
    end
  end
end
