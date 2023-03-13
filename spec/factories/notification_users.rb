FactoryBot.define do
  factory :notification_user do
    user { nil }
    notification { nil }
    read { false }
  end
end
