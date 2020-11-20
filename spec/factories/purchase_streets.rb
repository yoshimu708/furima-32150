FactoryBot.define do
  factory :purchase_street do
    # association :item

    phone_number        { 85_083_795_793 }
    post_code           { '893-3754' }
    adress              { '青山町1' }
    municipal_district  { '横浜市' }
    prefecture_id       { 4 }
    building            { 'ハイツ' }
    item_id             { 2 }
    token               { 'tok_abcdefghijk00000000000000000' }
    # purchase_id
  end
end
