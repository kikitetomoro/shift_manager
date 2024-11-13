class ShiftMailer < ApplicationMailer

# シフトリクエストメールの内容
    def shift_request(user, shift_setting)
        mail(
            to: user.email,
            from: shift_setting.admin_user.email,
            subject: 'シフトの希望調査'
          ) do |format|
            format.text do
              render plain: "シフト希望提出のお願い:\nhttp://127.0.0.1:3000/calendar へアクセスしてシフト希望を提出してください\n期日：#{shift_setting.deadline_date}"
            end
        end
      end
# リマインドメールの内容
      def shift_request_reminder(user, shift_setting)
        mail(
            to: user.email,
            from: shift_setting.admin_user.email,
            subject: 'シフトのリマインダー'
          ) do |format|
            format.text do
              render plain: "シフト希望のリマインド:\nhttp://127.0.0.1:3000/calendar へアクセスしてシフト希望を提出してください。\n期日：#{shift_setting.deadline_date}"
            end
        end
      end      
  end


