class CreateShiftTimes < ActiveRecord::Migration[7.2]
  def change
    create_table :shift_times do |t|
      t.references :shift_request, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
