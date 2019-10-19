class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :kana_name
      t.string :station
      t.string :place
      t.text :instagram
      t.integer :user_id

      t.timestamps
    end
  end
end
