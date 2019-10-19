class ApplicationController < ActionController::Base


before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!

def after_sign_in_path_for(resource)
  shops_path
end


protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:introduction,:profile_image])
  end

end
