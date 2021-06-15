FactoryBot.define do
  factory :item do
    name              { 'test' }
    information       { Faker::Lorem.sentence }
    category_id       { '2' }
    state_id          { '2' }
    postage_id        { '2' }
    region_id         { '2' }
    shipping_date_id  { '2' }
    price             { '777' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
