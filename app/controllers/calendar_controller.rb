class CalendarController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beginning_of_week
  before_action :set_shift_request, only: [:edit, :update]
  before_action :set_shift_time, only: [:edit, :update]



  # シフト希望の一覧表示
  def index
    @shift_requests = ShiftRequest.joins(:shift_setting)
                              .where("shift_settings.deadline_date >= ?", Date.today.day)
                              .where(user: current_user)
    @message = @shift_requests.exists? ? nil : '現在提出すべきシフト希望はありません'
  end


  # シフト希望の編集、なければ新しいものを作成
  def edit
    @shift_time = @shift_request.shift_times.first_or_initialize
  end

# シフト希望の更新
  def update
    @shift_time = @shift_request.shift_times.find_or_initialize_by(id: params[:shift_time_id])
    if @shift_time.update(shift_time_params)
      redirect_to calendar_index_path, notice: 'シフト時間が更新されました。'
    else
      render :edit, alert: 'シフト時間の更新に失敗しました。'
    end
  end

  private

  def shift_time_params
    params.require(:shift_request).permit(
      shift_times_attributes: [:shift_request_id, :start_time, :end_time,:date]
    ).tap do |shift_request_params|
      if shift_request_params[:shift_times_attributes].present?
        shift_request_params[:shift_times_attributes].each do |_, shift_time|
          if shift_time[:date].present?
            date = shift_time[:date]
            shift_time[:start_time] = DateTime.parse("#{date} #{shift_time[:start_time]}")
            shift_time[:end_time] = DateTime.parse("#{date} #{shift_time[:end_time]}")
          else
            Rails.logger.warn "dateが見つかりません"
          end
        end
      end
    end
  end




  def set_shift_request
    @shift_request = ShiftRequest.find(params[:id])
  end

  def set_shift_time
    @shift_time = @shift_request.shift_times.first_or_initialize
  end

# 日曜日から始まる
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
