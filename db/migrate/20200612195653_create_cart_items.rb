class CreateCartItems < ActiveRecord::Migration[6.0]
  
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      t.string :comment
      t.belongs_to :cart, foreign_key: true
      t.references :menu_item, foreign_key: true
      t.timestamps
    end
  end
end
