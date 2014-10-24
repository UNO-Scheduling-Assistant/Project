class Room < ActiveRecord::Base
	#self.primary_keys = :building, :room_num
	has_many :section_settings

	validates :building, presence: true
	validates :room_num, presence: true
end
