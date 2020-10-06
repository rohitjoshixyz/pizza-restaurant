class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  def create
      @cart = Cart.new
      session[cart_id] = @cart.id
      @cart.save
      @cart = Cart.find_by_id(session[:cart_id])
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = current_admin.cart
    @cart.cart_items.destroy_all
    flash[:info] = 'Cart was succesfully cleared'
    redirect_to cart_path(@cart)
  end

  private
    def invalid_cart
      logger.error "Attempt to access invalid cart with id: #{params[:id]}"
      flash[:danger] = 'The cart does not exist'
      redirect_to menu_items_path
    end
end
