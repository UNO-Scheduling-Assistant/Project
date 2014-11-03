module TimesHelper
  include ApplicationHelper

  def get_time_assoc
    TimeSlot.all.map{ |time| yield(time) }
  end

  def get_time_instructors
    get_time_assoc { |t| get_time_instructor(t) }
  end

  def get_time_instructor(time)
    time.section_settings.size
  end

  def get_time_sections
    get_time_assoc { |t| get_time_section(t) }
  end

  def get_time_section(time)
    sum = 0
    time.section_settings.each { |ss| sum += ss.sections.size }
    
    sum
  end

  def get_time_rooms
    get_time_assoc { |t| get_time_room(t) }
  end

  def get_time_room(time)
    time.section_settings.select('room_id').uniq.count
  end

  def get_hour_hash
    [["1", 1],
     ["2", 2],
     ["3", 3],
     ["4", 4],
     ["5", 5],
     ["6", 6],
     ["7", 7],
     ["8", 8],
     ["9", 9],
     ["10", 10],
     ["11", 11],
     ["12", 0]]
  end

  def get_minute_hash
    [["00", 0],
     ["05", 5],
     ["10", 10],
     ["15", 15],
     ["20", 20],
     ["25", 25],
     ["30", 30],
     ["35", 35],
     ["40", 40],
     ["45", 45],
     ["50", 50],
     ["55", 55]]
  end

  def get_period_hash
    [["A.M.", 0],
     ["P.M.", 1]]
  end
end
