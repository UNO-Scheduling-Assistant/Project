class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.string  :days
      t.integer :start_time_hour
      t.integer :start_time_minute
      t.integer :end_time_hour
      t.integer :end_time_minute

      t.timestamps
    end
  end
end
