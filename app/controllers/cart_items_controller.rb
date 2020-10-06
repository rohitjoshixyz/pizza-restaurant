class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    menu_item = MenuItem.find(params[:menu_item_id])
    @cart_item = @cart.add_menu_item(menu_item)
    if @cart_item.save
      flash[:success] = 'Item added to cart'
      redirect_to @cart_item.cart
    end
  end

  def destroy
    @cart = current_admin.cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    flash[:info] = 'Item deleted from cart'
    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:menu_item_id)
  end
end
