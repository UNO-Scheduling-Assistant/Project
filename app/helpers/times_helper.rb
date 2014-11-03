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
     ["12", 12]]
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
    [["A.M.", "AM"],
     ["P.M.", "PM"]]
  end

  def get_days(params)
    day_str = (params[:monday].nil? ? "" : "M" )
    day_str += (params[:tuesday].nil? ? "" : "T")
    day_str += (params[:wednesday].nil? ? "" : "W")
    day_str += (params[:thursday].nil? ? "" : "R")
    day_str += (params[:friday].nil? ? "" : "F")

    day_str
  end

  def get_stime(params)
    get_setime(params, {hr: :s_hr, min: :s_min, per: :s_per})

  end

  def get_etime(params)
     get_setime(params, {hr: :e_hr, min: :e_min, per: :e_per})
  end

  def get_setime(params, using)
    time = "#{params[using[:hr]]}:#{params[using[:min]]}:00 #{params[using[:per]]}"

    {hour: get_hour(time).to_i, minute: get_minute(time).to_i}
  end
end
