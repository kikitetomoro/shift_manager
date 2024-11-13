class CreateWorkShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :work_shifts do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :shortage_count
      t.string :shortage_details

      t.timestamps
    end
  end
end
