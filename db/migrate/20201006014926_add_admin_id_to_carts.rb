class AddAdminIdToCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :admin, index: true
    add_foreign_key :carts, :admins
    remove_column :admins, :cart_id, :bigint
  end
end
