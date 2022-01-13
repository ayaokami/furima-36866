FactoryBot.define do
  factory :item do
    item_name { '赤い本' }
    item_description {Faker::Lorem.sentence}
    category_id {'6'}
    condition_id  {'3'}
    shipping_charges_id {'2'}
    prefecture_id {'3'}
    ship_date_id {'2'}
    price {'500'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/book_315.png'), filename: 'book_315.png')
    end
  end
end
