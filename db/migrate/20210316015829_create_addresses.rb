class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :buy, foreign_key: true
      t.string :postal, null: false
      t.integer :prefectures_id, null: false
      t.string :municipality, null: false
      t.string :adress, null: false
      t.string :phone, null: false
      t.string :building

      t.timestamps
    end
  end
end
