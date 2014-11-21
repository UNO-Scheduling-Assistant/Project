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
  class RoomValidator < ActiveModel::Validator
    def nnil(num)
      num.nil? ? 0 : num
    end
    def validate(record)
      if nnil(record.room_num) <= 0
        record.errors[:base] << "Room num <= 0"
      end
    end
  end

  #self.primary_keys = :building, :room_num
  has_many :section_settings

  validates :building, presence: true
  validates :room_num, presence: true

  validates :room_num, numericality: { only_integer: true }
  validates_with RoomValidator
end
