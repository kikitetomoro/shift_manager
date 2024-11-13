# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  protected
# ユーザーのサインイン後のルート
  def after_sign_in_path_for(resource)
    calendar_index_path 
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:employee_id])
  end


end
