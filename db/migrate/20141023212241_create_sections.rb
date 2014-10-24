class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :class_num
      t.references :course
      t.references :section_setting
      t.integer :sec_id
      t.string :sec_description
      t.integer :sec_capacity
      t.string :crsatr_val
      t.string :mode
      t.string :acad_group
      t.string :location
      t.string :component

      t.timestamps
    end
    add_index :sections, ["course_id", "sec_id"], :unique => true
  end
end
