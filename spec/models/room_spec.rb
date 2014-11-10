require 'spec_helper'

describe Room do
  it "should not be valid with negative room number" do
    room = Room.new(building: "PKI", room_num: -2)
    room.should_not be_valid
  end

  it "should not be valid with room number of zero" do
    room = Room.new(building: "PKI", room_num: 0)
    room.should_not be_valid
  end

  it "should not be valid without building" do
    room = Room.new(room_num: 2)
    room.should_not be_valid
  end

  it "should be valid with building and positive room number" do
    room = Room.new(building: "PKI", room_num: 1)
    room.should be_valid
  end
end