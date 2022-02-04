class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :sn, null: false
      t.string :givenname, null: false
      t.string :username, null: false
      t.date :birthdate
      t.string :city, default: ""
      t.boolean :active, default: true
      t.belongs_to :category, null: false

      t.timestamps
    end
  end
end
