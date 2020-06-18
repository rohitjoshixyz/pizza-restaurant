class CartsController < ApplicationController
  def create
    
      @cart = Cart.new
      session[cart_id] = @cart.id
      @cart.save
      @cart = Cart.find_by_id(session[cart_id])
    end
  end



  private
    def set_cart
      if session[cart_id].nil?
        @cart = Cart.new
        session[cart_id] = @cart.id
        @cart.save
      else
        @cart = Cart.find_by_id(session[cart_id])
      end
    end

end
