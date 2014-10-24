class CourseDate < ActiveRecord::Base
	#self.primary_keys = :year, :semester
	
	has_many :section_settings

	validates :year, presence: true
	validates :semester, presence: true
end
