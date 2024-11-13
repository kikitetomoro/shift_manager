class ShiftSetting < ApplicationRecord
  before_create :set_default_name

  belongs_to :admin_user
  has_many :shift_requests
  has_many :shifts
  has_many :users, through: :shift_requests

  validates :send_date, presence: true
  validates :deadline_date, presence: true
  validates :remind_date, presence: true

# メール送信メソッド
    def send_emails
      users = User.all 
      users.each do |user|
        ShiftMailer.shift_request(user, self).deliver_now
      end
    end

# リマインドメール送信メソッド
    def send_reminder_emails
      users = User.all 
      users.each do |user|
        ShiftMailer.shift_request_reminder(user, self).deliver_now
      end
    end

    # シフトリクエストインスタンスを作成
    def self.create_shift_requests(shift_setting)
         users = User.all
         users.each do |user|
          ShiftRequest.create(user: user, shift_setting: shift_setting)
        end
    end
  
    
    # wheneverで実行されるメソッド
    def self.check_shift
      ShiftSetting.find_each do |shift_setting|
        # シフト設定の送信日担ったらシフトリクエスト作成メソッドを呼び出す
        if shift_setting.send_date==Date.today.day
          ShiftSetting.create_shift_requests(shift_setting)
        end
         # シフト設定の締め切り日を過ぎたら、シフト作成メソッドを呼び出す
        if shift_setting.deadline_date<Date.today.day
          WorkShift.create_shift_assignments()
        end
        # シフト設定の締め切り日を過ぎたら、シフトリクエストを消す
        if Date.today.day > shift_setting.deadline_date
          shift_setting.shift_requests.destroy_all
        end
      end
    end

  private


# シフト設定の名前生成
  def set_default_name
    if self.name.blank?
      current_count = ShiftSetting.count + 1
      self.name = "シフト設定-#{current_count}"
    end 
  end 
end  
