FactoryBot.define do
  factory :user do
    nickname              {'yamada'}
    email                 {Faker::Internet.free_email}
    password              {'yamada0110'}
    password_confirmation {password}
    last_name              {'山田'}
    first_name             {'太朗'}
    last_name_kana         {'ヤマダ'}
    first_name_kana        {'タロウ'}
    birth_date             {'1990-01-10'}
  end
end