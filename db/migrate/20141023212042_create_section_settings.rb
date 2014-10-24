class CreateSectionSettings < ActiveRecord::Migration
  def change
    create_table :section_settings do |t|
      t.references :time_slot
      t.references :instructor
      t.references :room
      t.references :course_date

      t.timestamps
    end
 end
end
