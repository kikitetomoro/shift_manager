class ShiftTime < ApplicationRecord
  belongs_to :shift_request
  validate :start_time_before_end_time
  has_one :user, through: :shift_request





  def start_time_before_end_time
    if start_time.present? && end_time.present? && start_time >= end_time
      errors.add(:start_time, "は終了時間より前である必要がありまEす")
    end
  end

end
