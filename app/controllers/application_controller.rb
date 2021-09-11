class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  #ログイン後の遷移先指定
  def after_sign_in_path_for(resource)
    case resource
    when Teacher
        teacher_teacher_path(current_teacher)
    when Parent
        connections_path
    end
  end
end