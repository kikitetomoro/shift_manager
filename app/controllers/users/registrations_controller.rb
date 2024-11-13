# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController


  protected


# ユーザーのサインイン後のルート
  def after_sign_in_path_for(resource)
    calendar_index_path
  end

end
