require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        subject: "Subject",
        content: "some text"
      ),
      Post.create!(
        subject: "Subject",
        content: "some text"
      )
    ])
  end

  it "renders a list of posts" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Subject".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("some text".to_s), count: 2
  end
end
