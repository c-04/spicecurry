class ApplicationController < ActionController::Base


before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!

def after_sign_in_path_for(resource)
  case resource
  when @administrator_page
      administrator_pages_shops_path
  when User
        user_path(current_user)
  end
end

def after_sign_out_path_for(resource)
  shops_path
end


protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:introduction,:profile_image])
  end

end
