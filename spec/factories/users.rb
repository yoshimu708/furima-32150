FactoryBot.define do
  factory :user do
    nickname { 'メカ星人' }
    email                 { 'test1@gmail.com' }
    password              { '708gogogo' }
    password_confirmation { password }
    first_name            { '芳村' }
    last_name             { '直哉' }
    first_name_reading    { 'ヨシムラ' }
    last_name_reading     { 'ナオヤ' }
    birthday              { '1997.9.28' }
  end
end
