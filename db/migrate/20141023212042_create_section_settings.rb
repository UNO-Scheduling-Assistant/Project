class CreateSectionSettings < ActiveRecord::Migration
  def change
    create_table :section_settings do |t|
      t.time_id :integer
      t.inst_id :integer
      t.room_id :integer
      t.date_id :integer

      t.timestamps
    end
  end
end
