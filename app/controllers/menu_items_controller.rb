class MenuItemsController < ApplicationController
  before_action :load_menu_item, only: %i[edit update show destroy]

  def index
    @menu_items = MenuItem.includes(:toppings).with_attached_photos.all
  end

  def new
    @menu_item = MenuItem.new
    @menu_item.toppings.build
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.save
    flash[:success] = 'Menu Item created successfully'
    redirect_to menu_items_path
  end

  def edit; end

  def update
    @menu_item.update(menu_item_params)
    flash[:success] = 'Menu Item updated successfully'
    redirect_to menu_items_path
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @menu_item.attributes}
    end
  end

  def destroy
    @menu_item.destroy
    flash[:info] = 'Menu Item deleted successfully'
    redirect_to menu_items_path
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :topping_ids, :size, :price, :is_veg, :category, :photos => [], toppings_attributes: %i[id name veg _destroy])
  end

  def load_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
