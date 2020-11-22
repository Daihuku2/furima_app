FactoryBot.define do
    factory :item do
      comments      {"傷ありです。"}
      name          {"パソコン"}
      price         {"20000"}
      category_id   {"2"}
      status_id     {"2"}
      burden_id     {"2"}
      area_id       {"2"}
      delivery_id   {"2"}

      after(:build) do |item|
        item.image.attach(io: File.open('spec/fixtures/sample1.png'),filename: 'sample1.png')
      end
    end
end