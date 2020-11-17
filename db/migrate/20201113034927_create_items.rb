class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.string :price,                null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :shipment_source_id,  null: false
      t.integer :estimated_arrival_id,null: false
      t.integer :delivery_fee_id,     null: false
      t.text    :explanation,         null: false
      t.timestamps
      t.references :user,             foreign_key:true
    end
  end
end
