class HomeController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end
end
