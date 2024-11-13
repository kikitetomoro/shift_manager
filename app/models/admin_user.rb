class AdminUser < ApplicationRecord
  has_many :shift_settings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :name, presence: true

end
