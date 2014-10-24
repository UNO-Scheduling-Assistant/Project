class SectionSetting < ActiveRecord::Base
	has_many    :sections

	belongs_to  :instructor
	belongs_to	:time_slot
	belongs_to  :room
	belongs_to  :course_date
	#belongs_to  :course_date, primary_key: "semester", foreign_key: "semester"
end
