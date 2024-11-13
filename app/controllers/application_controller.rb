class ApplicationController < ActionController::Base
  
  allow_browser versions: :modern


# サインアウト後のルート
  def after_sign_out_path_for(resource_or_scope)
    # 経営者と従業員でルートが異なる
    if resource_or_scope == :admin_user
      root_path 
    else
      calendar_index_path 
    end
  end


end
