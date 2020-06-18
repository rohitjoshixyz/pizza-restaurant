class CartItemsController < ApplicationController
  include CurrentCart
  before_action set_cart

  def create
    menu_item = MenuItem.find(params[menu_item_id])
    @cart_item = @cart.add_menu_item(menu_item)
    @cart_item
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:menu_item_id)
  end
end
