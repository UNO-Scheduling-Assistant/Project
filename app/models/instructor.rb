class Instructor < ActiveRecord::Base
	has_many :section_settings
	
	validates :first_name, presence: true
	validates :last_name, presence: true
end
