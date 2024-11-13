class ShiftSettingsController < ApplicationController
    before_action :authenticate_admin_user!
    before_action :set_shift_setting, only: [:edit, :update, :destroy]
  
    # シフト設定の一覧表示
    def index
      @shift_settings = ShiftSetting.all
    end
  
    # 新しいシフト設定を作成するためのフォームを表示
    def new
      @shift_setting = ShiftSetting.new
    end
  
    # 新しいシフト設定を保存
    def create
      @shift_setting = ShiftSetting.new(shift_setting_params)
      @shift_setting.admin_user = current_admin_user
      Rails.logger.debug("Current admin user: #{current_admin_user.inspect}")

      if @shift_setting.save
        Rails.logger.debug("設定された名前: #{@shift_setting.name}")
        redirect_to shift_settings_path, notice: 'シフト設定が作成されました。'
        
      else
        Rails.logger.debug("エラー内容: #{@shift_setting.errors.full_messages}")
        render :new
      end
    end
  
    # シフト設定の編集フォームを表示
    def edit
    end
  
   # シフト設定の編集フォームを表示
    def update
      if @shift_setting.update(shift_setting_params)
        redirect_to shift_settings_path, notice: 'シフト設定が更新されました。'
      else
        render :edit
      end
    end
  
    # シフト設定を削除
    def destroy
      @shift_setting.destroy
      redirect_to shift_settings_path, notice: 'シフト設定が削除されました。'
    end
  
    private

    # シフト設定IDを取得
    def set_shift_setting
      @shift_setting = ShiftSetting.find(params[:id])
    end
  
    def shift_setting_params
      params.require(:shift_setting).permit(:send_date, :deadline_date, :remind_date)
    end
  end
  