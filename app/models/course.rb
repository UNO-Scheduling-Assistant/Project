# == Description
# This is the table for courses
#
# == Column Names
# * subject
# * course_id
# * name
# 
# == Notes
# course_id is the course_number.
# It does not reference any table.
#
# == Model List
# Ordered by least dependent to most dependent
#
#
#
# Course
#
# CourseDate
#
# Instructor
#
# Room
#
# TimeSlot
#
# SectionSetting
#
# Section
class Course < ActiveRecord::Base
	#self.primary_keys = :course_id, :subject
	has_many :sections

	validates :course_id, presence: true
	validates :subject, presence: true
end
