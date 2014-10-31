# == Description
# This is the table for the course date. This is
# self-explanitory
#
# == Column Names
# * start_date
# * end_date
# 
# == Notes
# Pointless table because there's only one tuple.
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
class CourseDate < ActiveRecord::Base
	#self.primary_keys = :year, :semester
	
	has_many :section_settings

end
