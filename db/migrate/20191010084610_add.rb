class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :image_id, :text
    add_column :shops, :place_name, :text
  end
end
