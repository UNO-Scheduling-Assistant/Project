class CreateCourseDates < ActiveRecord::Migration
  def change
    create_table :course_dates do |t|
      t.year :integer
      t.semester :string
      t.start_date :date
      t.end_date :date

      t.timestamps
    end
  end
end
