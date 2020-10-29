class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :admin
  belongs_to :order, optional: true
  def add_menu_item(menu_item)
    current_cart_item = cart_items.find_by(menu_item_id: menu_item.id)
    if current_cart_item
      current_cart_item.increment(:quantity)
    else
      current_cart_item = cart_items.build(menu_item: menu_item)
    end
    current_cart_item
  end

  def count_menu_items
    count = 0
    cart_items.each do |cart_item|
      count += cart_item.quantity
    end
    count
  end

  def total
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.sub_total unless cart_item.sub_total.nil?
    end
    total
  end
end
