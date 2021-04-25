class OrdersController < ApplicationController
  def index
    @orders = Order.descending
  end

  def show
    @order = Order.find(params[:id])
  end
end
