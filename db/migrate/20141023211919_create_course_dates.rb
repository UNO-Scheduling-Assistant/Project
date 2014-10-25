class CreateCourseDates < ActiveRecord::Migration
  def change
    create_table :course_dates do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :course_dates, ["start_date", "end_date"], :unique => true
   # execute "ALTER TABLE course_dates ADD PRIMARY KEY(year,semester);"
  end
end
