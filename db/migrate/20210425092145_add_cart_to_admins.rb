class AddCartToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_reference :admins, :cart, index: true
  end
end
