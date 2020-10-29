class AddOrderIdToCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :order, index: true
  end
end
