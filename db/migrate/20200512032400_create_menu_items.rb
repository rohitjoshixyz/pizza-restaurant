class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.string :size
      t.integer :price
      t.string :category
      t.string :photo_url
      t.timestamps
    end
  end
end
