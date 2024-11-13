class UpdateShiftRequestsForPreferredTimes < ActiveRecord::Migration[7.2]
  def change
    add_column :shift_requests, :preferred_start_time, :datetime
    add_column :shift_requests, :preferred_end_time, :datetime

    remove_column :shift_requests, :preferred_dates, :date
  end
end
