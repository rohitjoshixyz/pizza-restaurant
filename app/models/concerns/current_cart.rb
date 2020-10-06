module CurrentCart

  private

  def set_cart
    if admin_signed_in? and current_admin.cart
        @cart = current_admin.cart
    else
      @cart = Cart.find(session[:cart_id])
    end
    rescue ActiveRecord::RecordNotFound
      @cart = current_admin.create_cart
      session[:cart_id] = @cart.id
    end
end
