class WorkShift < ApplicationRecord
    def self.create_shift_assignments
        # シフト情報を格納するための配列
        scheduled_shifts = []
        (1..31).each do |day|
          # ShiftRequest に関連する ShiftTime を含めて取得
          ShiftRequest.includes(:shift_times).find_each do |shift_request|
            shift_request.shift_times.each do |shift_time|
              # 1日から31日までの6:00-20:00の間でシフトを割り当てる
              if shift_time.start_time.to_date.day == day
                # シフト情報を配列に追加
                scheduled_shifts << {
                  user_id: shift_request.user_id,
                  date: shift_time.start_time.to_date,
                  start_time: shift_time.start_time,
                  end_time: shift_time.end_time
                }
              end
            end
          end
        end
      
        # 必要な時間帯の人数が揃っているか確認
        (6..20).each do |hour|
          # 各時間帯の開始と終了の時刻を設定
          time_slot_start = Time.current.change(hour: hour, min: 0)
          time_slot_end = time_s
          time_slot_start = Time.current.change(hour: hour, min: 0)
          time_slot_end = time_slot_start + 1.hour
      
          # 配列から指定された時間帯に割り当てられているシフトの人数をカウント
          shifts_in_time_slot = scheduled_shifts.select do |shift|
            shift[:start_time] >= time_slot_start && shift[:end_time] <= time_slot_end
          end.count
      
          # 人数が足りない場合、不足情報を ShiftShortage に記録
          if shifts_in_time_slot < 1
            WorkShift.create(
              start_time: Time.current.change(month: Time.current.month + 1, day: 1, hour: hour, min: 0),  # 次の月の1日
              end_time: Time.current.change(month: Time.current.month + 1, day: 31, hour: hour + 1, min: 0), # 月末の日の31日
              shortage_count: 1,  
              shortage_details: "不足: 1人、シフトに誰も割り当てられていません"  # 不足の詳細情報
            )
          end
        end
      end
      
  

    
end
