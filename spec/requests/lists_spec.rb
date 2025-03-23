require 'rails_helper'

RSpec.describe "/lists", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:list)
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      List.create! valid_attributes
      get lists_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      list = List.create! valid_attributes
      get list_url(list)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_list_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      list = List.create! valid_attributes
      get edit_list_url(list)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new List" do
        expect {
          post lists_url, params: { list: valid_attributes }
        }.to change(List, :count).by(1)
      end

      it "redirects to the created list" do
        post lists_url, params: { list: valid_attributes }
        expect(response).to redirect_to(list_url(List.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new List" do
        expect {
          post lists_url, params: { list: invalid_attributes }
        }.to change(List, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post lists_url, params: { list: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "a new list name" }
      }

      it "updates the requested list" do
        list = List.create! valid_attributes
        patch list_url(list), params: { list: new_attributes }
        list.reload
        expect(list.name).to eq("a new list name")
      end

      it "redirects to the list" do
        list = List.create! valid_attributes
        patch list_url(list), params: { list: new_attributes }
        list.reload
        expect(response).to redirect_to(list_url(list))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        list = List.create! valid_attributes
        patch list_url(list), params: { list: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested list" do
      list = List.create! valid_attributes
      expect {
        delete list_url(list)
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists list" do
      list = List.create! valid_attributes
      delete list_url(list)
      expect(response).to redirect_to(lists_url)
    end
  end
end
