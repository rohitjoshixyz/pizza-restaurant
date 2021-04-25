class AddIsVegToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :is_veg, :boolean, default: true
  end
end
