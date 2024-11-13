class User < ApplicationRecord
  has_many :shift_requests,dependent: :destroy
  has_many :shift_settings, through: :shift_requests
  has_many :shift_times, through: :shift_requests,dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:employee_id] 
  validates :employee_id, presence: true, uniqueness: true
end
