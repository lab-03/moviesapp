FactoryBot.define do
  factory :review do
    movie { nil }
    user { "MyString" }
    stars { 1 }
    review { "MyText" }
  end
end
