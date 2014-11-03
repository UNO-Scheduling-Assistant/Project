require 'csv'
require 'time'



module HomeHelper
  include ApplicationHelper
  
  def read_csv(file)
    csv = CSV.open file.path, headers: true

    csv.each { |row| put_row_into_database(row) }
  end

  private

  def put_row_into_database(row)
    write_section(row, write_course(row))

    sleep(0.3)
  end

  def write_section(row, course)
    section_setting = write_section_setting(row)
    insert_into Section, {class_num: row['Class Nbr'],
                          course_id: course,
                          section_setting_id: section_setting,
                          sec_id: row['Section'],
                          sec_description: row['SDescr'],
                          sec_capacity: row['Cap Enrl'],
                          acad_group: row['Acad Group'],
                          role: row['Role'],
                          session: row['Session'],
                          crsatr_val: row['CrsAtr Val'],
                          component: row['Component'],
                          location: row['Location'],
                          mode: row['Mode']}
  end

  def write_instructor(row)
    insert_into(Instructor, {first_name: row['First Name'], 
                             last_name: row['Last']})

  end

  def write_time_slot(row)
    insert_into TimeSlot,  {days: row['Pat'],
                            start_time: row['Mtg Start'],
                            end_time: row['Mtg End']}
  end

  def write_course_date(row)
    insert_into CourseDate, { start_date: row['Start Date'], 
                              end_date: row['End Date']}
  end

  def write_room(row)
    facil_id = get_building_and_room(row['Facil ID'])

    insert_into Room, { building: facil_id[:building],
                        room_num: facil_id[:room],
                        room_capacity: row['Capacity'] }
  end

  def write_section_setting(row)
    instructor = write_instructor(row)
    time_slot = write_time_slot(row)
    course_date = write_course_date(row)
    room = write_room(row)

    insert_into SectionSetting, { instructor_id: instructor,
                                  time_slot_id: time_slot,
                                  course_date_id: course_date,
                                  room_id: room }
  end

  def write_course(row)
    insert_into Course, subject: row['Subject'], course_id: row['Catalog'], name: row['CDescr']
  end



  def get_building_and_room(facil_id)
    facil_id.match(/([^0-9]+)([0-9]+)/)
    {building: $1, room: $2.to_i}
  end

end

