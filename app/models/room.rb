# == Description
# This is the table for the room properties
#
# == Column Names
# * building
# * room_num
# * room_capacity
# * desk_type
# * board_type
# * chair_type
# 
# == Notes
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
class Room < ActiveRecord::Base
	#self.primary_keys = :building, :room_num
	has_many :section_settings

	validates :building, presence: true
	validates :room_num, presence: true
end
