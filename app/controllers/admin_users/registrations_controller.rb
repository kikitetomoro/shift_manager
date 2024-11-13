# frozen_string_literal: true

class AdminUsers::RegistrationsController < Devise::RegistrationsController
  protected
# 経営者のサインイン後のリダイレクト
  def after_sign_up_path_for(resource)
    shifts_path 
  end

  # 経営者のサインイン後のリダイレクト
  def after_inactive_sign_up_path_for(resource)
    shifts_path 
  end



  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
