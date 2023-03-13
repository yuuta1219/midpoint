FactoryBot.define do
  factory :notification do
    message { "MyText" }
    read { false }
  end
end
