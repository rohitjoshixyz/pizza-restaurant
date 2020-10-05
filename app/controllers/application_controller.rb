class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :authenticate_admin!
  before_action :set_cart
end
