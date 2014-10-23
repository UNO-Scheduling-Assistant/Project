class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.course_id :integer
      t.subject :string
      t.course_id :integer
      t.name :string

      t.timestamps
    end
  end
end
