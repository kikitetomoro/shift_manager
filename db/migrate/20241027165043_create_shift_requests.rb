class CreateShiftRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :shift_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shift_setting, null: false, foreign_key: true
      t.text :preferred_dates

      t.timestamps
    end
    
  end
end


