FactoryBot.define do
  sequence :aname do |n|
    "aname_#{n}"
  end

  factory :person do
    username { generate(:aname) }
    sn { Faker::Name.last_name }
    givenname { Faker::Name.first_name }
  end

  factory :category do
    name { generate(:aname) }
  end

  factory :post do
    subject { Faker::Lorem.words(number: 4).join(" ") }
    content { Faker::Lorem.sentences(number: 3).join(" ") }
  end
end

