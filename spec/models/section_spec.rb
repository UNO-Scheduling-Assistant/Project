require 'spec_helper'

describe Section do
  context "should not be valid " do
    context "with negative " do
      it "enroll cap" do
        section = Section.new(class_num: 1, course_id: 1, section_setting_id: 1, sec_id: 1, sec_capacity: -3)
        section.should_not be_valid
      end
  
      it "class number" do
        section = Section.new(class_num: -1, course_id: 1, section_setting_id: 1, sec_id: 1)
        section.should_not be_valid
      end

      it "sec_id" do
        section = Section.new(class_num: 1, course_id: 1, section_setting_id: 1, sec_id: -1)
        section.should_not be_valid
      end
    end

    context "with non-numeric " do
      it "class number" do
        section = Section.new(class_num: "BAD", course_id: 1, section_setting_id: 1, sec_id: 1)
        section.should_not be_valid
      end

      it "sec_id" do
        section = Section.new(class_num: 1, course_id: 1, section_setting_id: 1, sec_id: "BAD")
        section.should_not be_valid
      end

      it "sec_capacity" do
        section = Section.new(class_num: 1, course_id: 1, section_setting_id: 1, sec_id: 1, sec_capacity: "BAD")
        section.should_not be_valid
      end
    end # context "with non-numeric"
  end

  context "should be valid " do
    
  end
end