class Cart < ApplicationRecord
  has_many :cart_items

  def total
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.sub_total
    end
    total
  end
end
