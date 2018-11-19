FactoryBot.define do
  factory :message do
    external_created_at { "2018-11-19 15:23:48" }
    user_followers { 1 }
    user_id { 1 }
    message { "MyText" }
    sentiment { "9.99" }
    user_handle { "MyString" }
  end
end
