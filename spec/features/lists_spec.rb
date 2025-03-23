require 'rails_helper' 

RSpec.describe "Lists", type: :feature, js: true do
  let!(:list) { FactoryBot.create(:list, name: "MyList") }
  let!(:task) { FactoryBot.create(:task, subject: "MyTask", list: list) }

  describe "visit lists_path" do
    before(:each) do
      visit root_path
    end

    it "shows lists/index" do
      click_link("Lists")
      find('a.dropdown-item[href="/lists"]').click()

      expect(page).to have_content("MyList")
    end

    it "shows list" do
      click_link("Lists")
      find('a.dropdown-item[href="/lists"]').click()
      find(%Q[a[href="/lists/#{list.id}"]]).click()
      expect(page).to have_content("Tasks")
      expect(page).to have_content("Add Task")
      expect(page).to have_content("#{task.id}: MyTask")
    end

    it "edit list" do
      click_link("Lists")
      find('a.dropdown-item[href="/lists"]').click()
      find(%Q[a[href="/lists/#{list.id}/edit"]]).click()
      
      expect(page).to have_content("Edit List")
      fill_in 'Name', with: "Other Name"
      click_button("Update List")
      expect(page).to have_content("Other Name")
      expect(page).to have_content("Tasks")
      expect(page).to have_content("Add Task")
      expect(page).to have_content("#{task.id}: MyTask")
    end

    it "create a new list" do
      click_link("Lists")
      find('a.dropdown-item[href="/lists/new"]').click()
      
      expect(page).to have_content("New List")
      fill_in 'Name', with: "Brand New List"
      click_button("Create List")
      expect(page).to have_content("Brand New List")
      expect(page).to have_content("Tasks")
      expect(page).to have_content("Add Task")
    end

    it "delete a list" do
      list2 = FactoryBot.create(:list, name: "ToBeDeleted")

      click_link("Lists")
      find('a.dropdown-item[href="/lists"]').click()

      expect(page).to have_content("Lists")
      accept_confirm do
        click_button("delete_list_#{list2.id}")
      end
      expect(page).not_to have_content("ToBeDeleted")
      expect(page).to have_content("Showing 1 to 1 of 1 entry")
    end
  end
end
