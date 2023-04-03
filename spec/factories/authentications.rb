FactoryBot.define do
  factory :authentication do
    provider { "MyString" }
    uid { "MyString" }
    user { nil }
  end
end
