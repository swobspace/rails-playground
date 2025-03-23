require 'rails_helper'

RSpec.describe "/posts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:post)
  }

  let(:invalid_attributes) {
    { subject: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Post.create! valid_attributes
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      post = Post.create! valid_attributes
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      post = Post.create! valid_attributes
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {{
        subject: "other subject",
        content: "very short new content"
      }}

      it "updates the requested post" do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(post.subject).to eq("other subject")
        expect(post.content.to_plain_text).to eq("very short new content")
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(post_url(post))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
