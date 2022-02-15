# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Category.create!(name: Faker::Movies::StarWars.specie)
end

100.times do
  Person.create!(sn: Faker::Name.last_name,
                givenname: Faker::Name.first_name,
                username: Faker::Internet.unique.username,
                birthdate: Faker::Date.birthday(min_age: 16, max_age: 75),
                city: Faker::Address.city,
                active: Faker::Boolean.boolean(true_ratio: 0.9),
                category_id: Category.all[rand(Category.count)].id)
end


list = List.find_or_create_by(name: "Primary List")

10.times do
  Task.create!(subject: Faker::Quote.famous_last_words,
              position: 0,
              list_id: list.id)
end
