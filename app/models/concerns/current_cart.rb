module CurrentCart

  private

  def set_cart
    @cart = Cart.find_by_id(session[cart_id]) if cart_id
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[cart_id] = @cart.id
  end
end