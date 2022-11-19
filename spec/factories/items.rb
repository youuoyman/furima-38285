FactoryBot.define do
  factory :item do
    item_name         {"hoge"}
    item_info         {Faker::Lorem.sentence}
    item_category_id  {2}
    status_id         {2}
    shipping_fee_id   {2}
    prefecture_id     {2}
    delivery_id       {2}
    item_price        {"5000"}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/design.jpg'), filename: 'design.jpg')
    end
  end
end
