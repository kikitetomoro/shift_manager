class FixWorkShifts < ActiveRecord::Migration[7.2]
  def change
    remove_column :work_shifts, :user_id

  end
end
