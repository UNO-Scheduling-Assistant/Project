class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.day :string
      t.start_time_hour :integer
      t.start_time_minute :integer
      t.end_time_hour :integer
      t.end_time_minute :integer

      t.timestamps
    end
  end
end
