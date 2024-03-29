FactoryBot.define do
  factory :purchase_order do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '123-4567' }
    region_id      { 2 }
    city           { '東京都' }
    street_address { '1-1' }
    suburb         { '東京ハイツ' }
    phone_number   { '09012345678' }
  end
end
