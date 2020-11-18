class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|

      t.timestamps
    end
  end
end
