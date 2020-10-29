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
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'cart',
        template: 'carts/show.pdf.haml',
        layout: 'pdf.html',
        :disposition => "inline"
      end
    end
  end

  def destroy
    @cart = current_admin.cart
    @cart.cart_items.destroy_all
    flash[:info] = 'Cart was succesfully cleared'
    redirect_to cart_path(@cart)
  end

  def place_order
    @cart = current_admin.cart
    @order = Order.create(cart: @cart, admin: current_admin)
    current_admin.cart = Cart.new(admin: current_admin)
    current_admin.save
    session[:cart_id] = @cart.id
    @cart = Cart.find_by_id(session[:cart_id])
    redirect_to order_path(@order)
  end

  private
    def invalid_cart
      logger.error "Attempt to access invalid cart with id: #{params[:id]}"
      flash[:danger] = 'The cart does not exist'
      redirect_to menu_items_path
    end
end
