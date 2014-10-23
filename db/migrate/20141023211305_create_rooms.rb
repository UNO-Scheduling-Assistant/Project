class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.building :string
      t.room_num :integer
      t.room_capacity :integer
      t.desk_type :string
      t.board_type :string
      t.chair_type :string
      t.timestamps
    end
  end
end
