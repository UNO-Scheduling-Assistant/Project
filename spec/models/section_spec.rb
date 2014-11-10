require 'spec_helper'

describe Section do
  it "should not be valid with negative enroll cap" do
    section = Section.new(class_num: 1, course_id: 1, section_setting_id: 1, sec_id: 1, sec_capacity: -3)
    section.should_not be_valid
  end
  
  it "should not be valid with negative class number" do
    section = Section.new(class_num: -1, course_id: 1, section_setting_id: 1, sec_id: 1)
    section.should_not be_valid
  end

  it "should not be valid with negative sec_id" do
    section = Section.new(class_num: 1, course_id: 1, section_setting_id: 1, sec_id: -1)
    section.should_not be_valid
  end
end