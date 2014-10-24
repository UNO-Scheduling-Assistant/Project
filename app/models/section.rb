class Section < ActiveRecord::Base
	belongs_to :course, foreign_key: :subject
	belongs_to :course, foreign_key: :course_id
	belongs_to :section_setting

	validates :sec_id, presence: true
	
end
