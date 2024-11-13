class AddUserIdToWorkShifts < ActiveRecord::Migration[7.2]
  def change
    add_column :work_shifts, :user_id, :integer
    remove_column:work_shifts
  end
end
