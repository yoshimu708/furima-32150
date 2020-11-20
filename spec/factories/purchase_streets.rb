FactoryBot.define do
  factory :purchase_street do
    t.string :phone_number        ,null: false
    t.string :post_code           ,null: false
    t.string :adress              ,null: false
    t.string :municipal_district  ,null: false
    t.integer :prefecture_id      ,null: false
    t.references :purchase,       foreign_key:true
    t.string :building
    t.timestamps
  end
end
