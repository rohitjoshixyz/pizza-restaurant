class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :table

      t.timestamps
    end
    add_reference :cart_items, :cart, foreign_key: true
  end
end
