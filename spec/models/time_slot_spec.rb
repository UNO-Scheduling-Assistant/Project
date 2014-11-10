require 'spec_helper'

describe TimeSlot do
  it "should be valid with correct time format" do
    time = TimeSlot.new(days: "M", start_time: "1:30:00 PM", end_time: "2:30:00 PM")
    time.should be_valid
  end

  it "should not be valid with incorrect time format" do
    time1 = TimeSlot.new(days: "M", start_time: "1:30:0 PM", end_time: "2:30:00 PM")
    time2 = TimeSlot.new(days: "M", start_time: "1:5:00 PM", end_time: "2:30:00 PM")
    time3 = TimeSlot.new(days: "M", start_time: "1:30:00 PM", end_time: "2:3:00 PM")
    time4 = TimeSlot.new(days: "M", start_time: "1:30:00 PM", end_time: "3:30:0 PM")

    time1.should_not be_valid
    time2.should_not be_valid
    time3.should_not be_valid
    time4.should_not be_valid
  end
end