class CartItem < ApplicationRecord
    belongs_to :menu_item
    belongs_to :cart
    def sub_total
      if menu_item.price.present?
        # actual_price = 0
        # case menu_item.size
        #   when 'Small'
        #     actual_price = menu_item.price
        #   when 'Medium'
        #     actual_price = menu_item.price + 100
        #   when 'Large'
        #     actual_price = menu_item.price + 200
        #   else
        #     actual_price = menu_item.price
        # end
        # actual_price * quantity
        menu_item.price * quantity
      end
    end
end
