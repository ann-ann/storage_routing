FactoryBot.define do
  factory :destination do
    name {Faker::Name.first_name}
    categories {[Faker::Name.first_name, Faker::Name.first_name ]}
    references {[Faker::Number.number(digits: 10), Faker::Number.number(digits: 10)]}
    prices {[Faker::Number.decimal(l_digits: 2), Faker::Number.decimal(l_digits: 2)]}
    names {[Faker::Name.first_name, Faker::Name.first_name]}
  end
end
