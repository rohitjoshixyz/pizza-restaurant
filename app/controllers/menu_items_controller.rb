class MenuItemsController < ApplicationController
  before_action :load_menu_item, only: [:edit, :update, :show, :destroy]

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

  def edit
  end

  def update
    @menu_item.update(menu_item_params)
    flash[:success] = "Menu Item updated successfully"
    redirect_to menu_items_path
  end

  def show
  end

  def destroy
    @menu_item.destroy
    flash[:info] = "Menu Item deleted successfully"
    redirect_to menu_items_path
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :topping_ids, :size, :price, :category, :photo_url, :photo, toppings_attributes: [:id, :name, :veg, :_destroy])
  end

  def load_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
