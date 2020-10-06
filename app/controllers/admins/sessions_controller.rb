class Admins::SessionsController < Devise::SessionsController
  include CurrentCart

  def after_sign_out_path_for(_resource_or_scope)
    session[:cart_id] = nil
    new_admin_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    set_cart
    stored_location_for(resource_or_scope) || root_path
  end
end