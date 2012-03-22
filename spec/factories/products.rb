# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "Product#{n}#{rand(100)}"
  end

  factory :product do
    name
    price 1.23
  end
end
