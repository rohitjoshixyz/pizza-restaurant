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
    @cart = Cart.find(session[:cart_id])
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:menu_item_id)
  end
end
