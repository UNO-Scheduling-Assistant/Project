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

    add_index :time_slots, ["days", "start_time_hour", "start_time_minute", "end_time_hour", "end_time_minute"], unique: true, name: "time_slot_index"
  end
end
