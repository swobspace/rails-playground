require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:post) {
    Post.create!(
      subject: "MyString",
      content: "some text"
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do

      assert_select "input[name=?]", "post[subject]"

      assert_select "input[name=?]", "post[content]"
    end
  end
end
