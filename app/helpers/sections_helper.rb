module SectionsHelper
  def get_option_list(params=nil)
    list = {}
    list[:rooms] = update_rooms(params) unless disabled(params, :room_disabled)
    list[:times] = update_times(params) unless disabled(params, :time_disabled)

    list[:room] = update_current_room(params, list) unless disabled(params, :room_disabled)
    list[:time] = update_current_time(params, list) unless disabled(params, :time_disabled)

    list
  end

  def update_rooms(params=nil)
    rooms = Room.all
    room_list = []
    room_list << ["None", nil]
    rooms.each { |r| room_list << r.to_arr_element if room_qualified?(r, params)}

    room_list
  end

  def update_times(params=nil)
    times = {}
    times[:days] = update_days(params)
    times[:start] = update_time(params, :start)
    times[:end] = update_time(params, :end)

    times
  end

  private

  def disabled(params, tag)
    return false if params.nil? || params[tag].nil?
    params[tag].eql?("true")
  end

  def update_days(params)
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  end

  def update_current_room(params, hash)

    return default_element if params.nil?

    room_id = params[:room].to_i

    puts room_id

    return default_element if room_id == 0

    puts room_id

    hash[:rooms].each do |room_set|
      return room_set if room_set[1] == room_id
    end

    puts "Here"
    default_element
  end

  def update_current_time(params, hash)
    
  end

  def update_time(params, what)
    time = {}
    time = update_from_times(params) if what == :end

    unless what == :end
      time[:period] = update_period(params)
      time[:hours] = update_hours(params)
      time[:minutes] = update_minutes(params)
    end

    time
  end

  def update_period(params)
    periods = []
    periods << default_element
    periods << ["AM", "AM"]
    periods << ["PM", "PM"]

    periods
  end

  def update_hours(params)
    hours = []
    hours << default_element
    (1..12).each { |n| hours << [n.to_s, n] }
    hours
  end

  def update_minutes(params)
    minutes = []
    minutes << default_element
    (0..11).each { |n| minutes << [sprintf("%02d", n * 5), sprintf("%02d", n * 5)] }
    minutes
  end

  def room_qualified?(room, params)
   # puts params
    return true if params.nil?
   # puts "Here"
    return false unless radio_button_good?(params[:board], room.board_type)
    return false unless radio_button_good?(params[:chair], room.chair_type)
    return false unless radio_button_good?(params[:desk], room.desk_type)

    #return false unless params[:board].nil? || params[:board].eql?("on") || room.board_type.eql?(params[:board])
   # return false unless params[:board]
   # puts "Must be true"
    true
  end

  def radio_button_good?(param, checker)
    param.nil? || param.eql?("on") || checker.eql?(param)
  end

  def default_element
    ["None", nil]
  end

  def update_from_times(params)
    valid = !(params.nil? || params[:stime_h].empty? || params[:stime_m].empty? || params[:stime_p].empty?)
    time = {}
    
    time[:period] = [] << default_element
    time[:hours] = [] << default_element
    time[:minutes] = [] << default_element

    time = add_time_end(params, time) if valid

    time
  end

  def add_time_end(params, time)
    time[:period] = add_end_period(params, time[:period])
    time[:hours] = add_end_hours(params, time[:hours])
    time[:minutes] = add_end_minutes(params, time[:minutes])

    time
  end

  def add_end_period(params, periods)
    ["AM", "PM"].each { |p| periods << [p, p] if period_qualified?(params, p) }
    periods
  end

  def add_end_hours(params, hours)
    (1..12).each { |h| hours << [h, h.to_s] if hour_qualified?(params, h) }
    hours
  end

  def add_end_minutes(params, minutes)
    (0..11).each { |m| minutes << [sprintf("%02d", m * 5), m * 5] if minute_qualified?(params, m * 5) }
    minutes
  end

  def period_qualified?(params, p)
    return false if p.eql?("AM") && params[:stime_p].eql?("PM")

    if p.eql?("AM")
      return false if cannot_advance_period?(params)
      return true
    end

    if p.eql?("PM")
      return true if params[:stime_p].eql?("AM")
      return false if cannot_advance_period?(params)
    end

    true
  end

  def cannot_advance_period?(params)
    return params[:stime_h].to_i == 11 && params[:stime_m].to_i == 55
  end

  def hour_qualified?(params, h)
    return false if params[:etime_p].empty?

    # Start time is in the AM, and end time is in PM, all is allowed
    return true if !params[:stime_p].eql?(params[:etime_p])

    # Same hour
    if h.to_i == params[:stime_h].to_i
      # Cannot go beyond 55 minutes in 5 minute interval
      return false if params[:stime_m].to_i == 55
      return true
    end

    # We know that periods match at this point.
    # Disqualified if hour is less than start hour
    return false if h.to_i < params[:stime_h]

    true
  end

  def minute_qualified?(params, m)
    true
  end

end
