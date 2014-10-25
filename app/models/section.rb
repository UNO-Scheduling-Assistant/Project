class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :section_setting

  validates :sec_id, presence: true
  
  def self.report_table_query
    report_query = ([]  <<  'sections.class_num as class_num, ' <<
                        'courses.subject as subject, ' <<
                        'courses.course_id as course_id, ' <<
                        'sections.sec_id as sec_id, ' <<
                        'courses.name as course_name, ' <<
                        'sections.sec_description as section_description, ' <<
                        'sections.acad_group as acad_group, ' <<
                        'sections.sec_capacity as enroll_cap, ' <<
                        'time_slots.days as days, ' <<
                        'time_slots.start_time_hour as start_hour, ' <<
                        'time_slots.start_time_minute as start_minute, ' <<
                        'time_slots.end_time_hour as end_hour, ' <<
                        'time_slots.end_time_minute as end_minute, ' <<
                        'rooms.building as building, ' <<
                        'rooms.room_num as room_num, ' <<
                        'rooms.room_capacity as room_cap, ' <<
                        'instructors.last_name as last_name, ' <<
                        'instructors.first_name as first_name, '  <<
                        'course_dates.start_date as start_date, ' <<
                        'course_dates.end_date as end_date, ' <<
                        'sections.location as location, ' <<
                        'sections.mode as mode, ' <<
                        'sections.crsatr_val as crsatr_val, ' <<
                        'sections.component as component').join("")
    
    Section.joins(:course, section_setting: [:instructor, :time_slot, :room, :course_date]).select(report_query).to_a
  end
end
