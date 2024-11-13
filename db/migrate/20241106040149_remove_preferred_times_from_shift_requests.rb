class RemovePreferredTimesFromShiftRequests < ActiveRecord::Migration[7.2]
  def change
    remove_column :shift_requests, :preferred_start_time, :datetime
    remove_column :shift_requests, :preferred_end_time, :datetime
  end
end
