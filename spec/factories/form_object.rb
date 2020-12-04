FactoryBot.define do
  factory :form_object do
    postal_code   {"123-1234"}
    prefecture_id {2}
    city          {"択捉島"}
    address       {"どこか3-3"}
    building_name {}
    phone_number  {"09012345678"}
    token         {"eeeee22222222"}
  end
end