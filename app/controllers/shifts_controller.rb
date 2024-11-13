class ShiftsController < ApplicationController



  def index
    @shifts = Shift.all
    @message = @shifts.exists? ? nil : '現在シフトはありません'


    @days = (1..31).to_a 
    @users = User.all 

    # シフトデータをユーザーごと・日付ごとに整理
    shift_data = ShiftTime.includes(:shift_request).group_by do |shift|
      [shift.shift_request.user_id, shift.start_time.day]
    end

    # テーブル用のデータ構造を作成
    @shift_table = @users.map do |user|
      row = @days.map do |day|
        if shift_data[[user.id, day]]
          shift = shift_data[[user.id, day]].first
          "#{shift.start_time.strftime('%H:%M')} - #{shift.end_time.strftime('%H:%M')}"
        else
          ""
        end
      end
      { user: user, shifts: row }
    end
  end
end
