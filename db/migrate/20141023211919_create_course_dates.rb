class CreateCourseDates < ActiveRecord::Migration
  def change
    create_table :course_dates do |t|
      t.integer :year
      t.string :semester
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :course_dates, ["year", "semester"], :unique => true
   # execute "ALTER TABLE course_dates ADD PRIMARY KEY(year,semester);"
  end
end
