FactoryBot.define do
    factory :item_user do
      association :user
      association :item
    end
end