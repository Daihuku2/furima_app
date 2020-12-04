FactoryBot.define do
    factory :user do
      nickname {Faker::Name.name}   
      email {Faker::Internet.free_email}
      password              {"aaa111"}
      password_confirmation {password}
      family_name_kanji     {"田中"}
      first_name_kanji      {"誠"}
      family_name_kana      {"タナカ"}
      first_name_kana       {"マコト"}
      birthday              {"1930-1-1"}
    end
end