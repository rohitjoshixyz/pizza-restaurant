class Cart < ApplicationRecord
  has_many :cart_items

  def add_menu_item(menu_item)
    current_cart_item = cart_items.find_by_id(menu_item.id)
    if current_cart_item
      current_cart_item.increment(:quantity)
    else
      current_cart_item = CartItem.build(menu_item: menu_item)
    end
    current_cart_item
  end

  def total
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.sub_total
    end
    total
  end
end
