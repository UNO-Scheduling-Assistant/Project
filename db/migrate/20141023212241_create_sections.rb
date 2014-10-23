class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.class_number :integer
      t.course_id :integer
      t.sec_id :integer
      t.sec_description :string
      t.sec_cap :integer
      t.crastr_val :string
      t.mode :string
      t.acad_group :string
      t.location :string
      t.component :string

      t.timestamps
    end
  end
end
