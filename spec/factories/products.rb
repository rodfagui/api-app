FactoryGirl.define do
  factory :product do
    name { FFaker::Product.product }
    price 200.0
    quantity 12
  end
end