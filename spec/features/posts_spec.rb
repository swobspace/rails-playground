require 'rails_helper' 

RSpec.describe "Posts", type: :feature, js: true do
  let!(:post) { FactoryBot.create(:post, subject: "MyPost") }

  describe "visit posts_path" do
    before(:each) do
      visit root_path
    end

    it "shows posts/index" do
      click_link("Posts")
      find('a.dropdown-item[href="/posts"]').click()

      expect(page).to have_content("MyPost")
    end

    it "shows post" do
      click_link("Posts")
      find('a.dropdown-item[href="/posts"]').click()
      find(%Q[a[href="/posts/#{post.id}"]]).click()
      expect(page).to have_content("MyPost")
    end

    it "edit post" do
      click_link("Posts")
      find('a.dropdown-item[href="/posts"]').click()
      find(%Q[a[href="/posts/#{post.id}/edit"]]).click()
      
      expect(page).to have_content("Edit Post")
      fill_in 'Subject', with: "Other Post"
      find("trix-editor#post_content").set("Cogito ergo sum")
      click_button("Update Post")
      expect(page).to have_content("Other Post")
      expect(page).to have_content("Cogito ergo sum")
    end

    it "create a new post" do
      click_link("Posts")
      find('a.dropdown-item[href="/posts/new"]').click()
      
      expect(page).to have_content("New Post")
      fill_in 'Subject', with: "Brand New Post"
      find("trix-editor#post_content").set("Cogito ergo sum")
      click_button("Create Post")
      expect(page).to have_content("Brand New Post")
    end

    it "delete a post" do
      post2 = FactoryBot.create(:post, subject: "ToBeDeleted")

      click_link("Posts")
      find('a.dropdown-item[href="/posts"]').click()

      expect(page).to have_content("Posts")
      accept_confirm do
        click_button("delete_post_#{post2.id}")
      end
      expect(page).not_to have_content("ToBeDeleted")
      expect(page).to have_content("Showing 1 to 1 of 1 entry")
    end
  end
end
