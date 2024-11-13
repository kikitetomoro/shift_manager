# frozen_string_literal: true

class AdminUsers::SessionsController < Devise::SessionsController
  protected
# 経営者のサインイン後のルート
  def after_sign_in_path_for(resource)
    shifts_path
  end


end
