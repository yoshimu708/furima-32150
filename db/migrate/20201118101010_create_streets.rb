class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
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
end
#t.string :hoge