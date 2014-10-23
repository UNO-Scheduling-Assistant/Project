class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.first_name :string
      t.last_name :string

      t.timestamps
    end
  end
end
