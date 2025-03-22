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
end

