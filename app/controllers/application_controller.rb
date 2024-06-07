class ApplicationController < ActionController::Base
    
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end

        def after_sign_in_path_for(resource)
          mypage_path
        end
      
        def after_sign_out_path_for(resource)
          new_user_session_path
        end
    
end
