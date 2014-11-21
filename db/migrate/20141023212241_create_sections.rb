class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :class_num#, default: 0
      t.references :course
      t.references :section_setting#, default: 0
      t.integer :sec_id
      t.string :sec_description
      t.integer :sec_capacity#, default: 0
      t.string :crsatr_val
      t.string :mode
      t.string :acad_group
      t.string :location
      t.string :component
      t.string :role
      t.integer :session

      t.timestamps
    end
    add_index :sections, ["course_id", "sec_id", "section_setting_id"], name: "section_index", :unique => true
  end
end
