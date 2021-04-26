FactoryBot.define do
  factory :product do
    name {Faker::Name.first_name}
    category {Faker::Name.first_name}
    reference {Faker::Number.number(digits: 10)}
    price {Faker::Number.decimal(l_digits: 2)}
  end
end
