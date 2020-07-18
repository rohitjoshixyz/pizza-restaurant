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
    @cart.destroy if @cart.id = session[:cart_id]
    session[:cart_id] = nil
    flash[:info] = 'Cart was succesfully destroyed'
    redirect_to menu_items_path
  end

  private
    def invalid_cart
      logger.error "Attempt to access invalid cart with id: #{params[:id]}"
      flash[:danger] = 'The cart does not exist'
      redirect_to menu_items_path
    end
end
