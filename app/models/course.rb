class Course < ActiveRecord::Base
	#self.primary_keys = :course_id, :subject
	has_many :sections

	validates :course_id, presence: true
	validates :subject, presence: true
end
