FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { Faker::Internet.free_email }
    password               { 'aaa000' }
    password_confirmation  { 'aaa000' }
    last_name              { '山田' }
    first_name             { '太郎' }
    last_name_kana         { 'ヤマダ' }
    first_name_kana        { 'タロウ' }
    birthday               { '2021-01-01' }
  end
end
