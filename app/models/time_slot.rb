# == Description
# This is the table for the time slots
#
# == Column Names
# * days
# * start_time_hour
# * start_time_minute
# * end_time_hour
# * end_time_minute
# 
# == Notes
# Hours are to be formatted in 24h format, rather
# than the 12h format.
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
class TimeSlot < ActiveRecord::Base
	has_many :section_settings

	validates :days, presence: true
	validates :start_time_hour, presence: true
	validates :start_time_minute, presence: true
	validates :end_time_hour, presence: true
	validates :end_time_minute, presence: true
end
