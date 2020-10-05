class HomeController < ApplicationController
  skip_before_action :authenticate_admin!
  def index
    @menu_items = MenuItem.all
  end
end
