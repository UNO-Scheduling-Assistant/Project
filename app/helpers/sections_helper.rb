module SectionsHelper
  def get_option_list(params=nil)
    list = {}
    list[:rooms] = update_rooms(params)
    list[:times] = update_times(params)

    list
  end

  def update_rooms(params=nil)
    rooms = Room.all
    room_list = []
    room_list << ["None", nil]
    rooms.each { |r| room_list << r.to_arr_element if room_qualified?(r, params)}

    print room_list
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

  def  update_days(params)
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  end

  def update_time(params, what)
    time = {}
    time[:period] = update_period(params)
    time[:hours] = update_hours(params)
    time[:minutes] = update_minutes(params)

    time
  end

  def update_period(params)
    periods = []
    periods << ["None", nil]
    periods << ["AM", "AM"]
    periods << ["PM", "PM"]

    periods
  end

  def update_hours(params)
    hours = []
    (1..12).each { |n| hours << [n.to_s, n] }
    hours
  end

  def update_minutes(params)
    minutes = []
    (0..11).each { |n| minutes << [sprintf("%02d", n * 5), sprintf("%02d", n * 5)] }
    minutes
  end

  def update_end(params)

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
end
