class CreateCartItems < ActiveRecord::Migration[6.0]
  
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      t.string :comment
      t.timestamps
    end
    add_reference :menu_items, :cart_item, foreign_key: true
  end
end
