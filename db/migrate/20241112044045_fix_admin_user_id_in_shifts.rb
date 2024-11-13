class FixAdminUserIdInShifts < ActiveRecord::Migration[7.2]
  def change
    drop_table :shifts
    drop_table :shift_assignments
  end
end
