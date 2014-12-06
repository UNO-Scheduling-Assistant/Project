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
	class TimeSlotValidator < ActiveModel::Validator
		include ApplicationHelper

    def cond_error(r, cond, error)
      if cond
        r.errors[:base] << error
      end
    end

    def correct_format
      /\d?\d:\d\d:\d\d [AP]M/
    end

    ###################################
    #      Validation Methods         #
    ###################################
    def is_correct_format?(r)
      r.start_time =~ correct_format && r.end_time =~ correct_format
    end

    def start_time_gt_end_time?(r)
      return false if r.start_time.nil? || r.end_time.nil?
      (hour(r.start_time) > hour(r.end_time)) ||
      (hour(r.start_time) == hour(r.end_time) && minute(r.start_time) >= minute(r.end_time))
    end

    def days_correct?(r)
      r.days.nil? || r.days =~ /[MTWRFS]+/
    end

    def validate(record)
      return if (record.days.nil? && record.start_time.nil? && record.end_time.nil?)

      cond_error(record, start_time_gt_end_time?(record), "Start time is greater than end time")
      cond_error(record, !is_correct_format?(record), "Incorrect time format")
      cond_error(record, !days_correct?(record), "Incorrect day(s)")
    end
  end

	has_many :section_settings
  validates_with TimeSlotValidator

end
