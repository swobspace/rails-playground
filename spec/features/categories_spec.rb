require 'rails_helper' 

RSpec.describe "Categories", type: :feature, js: true do
  let!(:category) { FactoryBot.create(:category, name: "MyCategory") }

  describe "visit categories_path" do
    before(:each) do
      visit root_path
    end

    it "shows categories/index" do
      click_link("Categories")
      find('a.dropdown-item[href="/categories"]').click()

      expect(page).to have_content("MyCategory")
    end

    it "shows category" do
      click_link("Categories")
      find('a.dropdown-item[href="/categories"]').click()
      find(%Q[a[href="/categories/#{category.id}"]]).click()
      expect(page).to have_content("People of Category: MyCategory")
    end

    it "edit category" do
      click_link("Categories")
      find('a.dropdown-item[href="/categories"]').click()
      find(%Q[a[href="/categories/#{category.id}/edit"]]).click()
      
      expect(page).to have_content("Edit Category")
      fill_in 'Name', with: "Other Name"
      click_button("Update Category")
      expect(page).to have_content("People of Category: Other Name")
    end

    it "create a new category" do
      click_link("Categories")
      find('a.dropdown-item[href="/categories/new"]').click()
      
      expect(page).to have_content("New Category")
      fill_in 'Name', with: "Brand New Category"
      click_button("Create Category")
      expect(page).to have_content("People of Category: Brand New Category")
    end

    it "delete a category" do
      category2 = FactoryBot.create(:category, name: "ToBeDeleted")

      click_link("Categories")
      find('a.dropdown-item[href="/categories"]').click()

      expect(page).to have_content("Categories")
      accept_confirm do
        click_button("delete_category_#{category2.id}")
      end
      expect(page).not_to have_content("ToBeDeleted")
      expect(page).to have_content("Showing 1 to 1 of 1 entry")
    end
  end
end
