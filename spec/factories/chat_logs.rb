FactoryBot.define do
  factory :chat_log do
    user { nil }
    input { "MyText" }
    output { "MyText" }
  end
end
