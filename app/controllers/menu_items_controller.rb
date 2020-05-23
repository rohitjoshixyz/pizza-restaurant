class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
    @menu_item.toppings.build
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.save
    redirect_to menu_items_path
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :topping_ids, :size, :price, :category, :photo_url, :photo, toppings_attributes: [:id, :name, :veg, :_destroy])
  end
end
