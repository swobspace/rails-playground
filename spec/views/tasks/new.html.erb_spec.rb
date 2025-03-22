require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      subject: "MyString",
      position: 1,
      list: nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[subject]"

      assert_select "input[name=?]", "task[position]"

      assert_select "input[name=?]", "task[list_id]"
    end
  end
end
