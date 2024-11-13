class CreateShiftSettings < ActiveRecord::Migration[7.2]
  def change
    create_table :shift_settings do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.string :name
      t.integer :send_date
      t.integer :remind_date
      t.integer :deadline_date

      t.timestamps
    end
  end
end
