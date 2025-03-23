require 'rails_helper' 

RSpec.describe "Tasks", type: :feature, js: true do
  let!(:list) { FactoryBot.create(:list, name: "MyList") }
  let!(:task) { FactoryBot.create(:task, subject: "MyTask", list: list) }

  describe "visit lists_path" do
    before(:each) do
      visit list_path(list)
    end

    it "shows list" do
      expect(page).to have_content("MyList")
      expect(page).to have_content("Tasks")
      expect(page).to have_content("Add Task")
      expect(page).to have_content("#{task.id}: MyTask")
    end

    it "create a new task" do
      click_link("Add Task")
      within "#modal" do
        fill_in "Subject", with: "Yet Another Task"
      end
      click_button("Create Task")
      within "#list_tasks" do
        expect(page).to have_content("Yet Another Task")
      end
    end

    it "edit task" do
      visit list_tasks_path(list)
      expect(page).to have_content("Tasks")
      expect(page).to have_content("MyTask")
      find(%Q[a[href="/lists/#{list.id}/tasks/#{task.id}/edit"]]).click()
      
      expect(page).to have_content("Edit Task")

      within "#modal" do
        fill_in 'Subject', with: "Other Task Name"
      end
      click_button("Update Task")

      expect(page).to have_content("Tasks")
      expect(page).to have_content("Tasks")
      expect(page).to have_content("Showing 1 to 1 of 1 entry")
      pending "update table after edit doesn't work yet"
      expect(page).to have_content("Other Task Name")
    end

    it "delete a task" do
      task2 = FactoryBot.create(:task, subject: "ToBeDeleted", list: list)
      visit list_path(list)

      expect(page).to have_content("ToBeDeleted")
      accept_confirm do
        click_button("delete_task_#{task2.id}")
      end
      expect(page).to have_content("MyList")
      expect(page).to have_content("Tasks")
      within "#list_tasks" do
        expect(page).not_to have_content("ToBeDeleted")
      end
    end
  end
end
