class TimeSlot < ActiveRecord::Base
	has_many :section_settings

	validates :days, presence: true
	validates :start_time_hour, presence: true
	validates :start_time_minute, presence: true
	validates :end_time_hour, presence: true
	validates :end_time_minute, presence: true
end
