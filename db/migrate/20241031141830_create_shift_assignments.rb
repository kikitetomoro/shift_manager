class CreateShiftAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :shift_assignments do |t|
      t.references :shift, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
