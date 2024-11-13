class ShiftRequest < ApplicationRecord
  belongs_to :user
  belongs_to :shift_setting
  has_many :shift_times, dependent: :destroy
  accepts_nested_attributes_for :shift_times, allow_destroy: true


end
