FactoryBot.define do
  factory :message do
    external_created_at { "2018-11-19 15:23:48" }
    user_followers { 1 }
    user_id { 1 }
    message { "This is a test message" }
    sentiment { -0.03 }
    user_handle { "@jpincus" }
  end
end
