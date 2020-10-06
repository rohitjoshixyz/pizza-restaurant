class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :authenticate_admin!
end
