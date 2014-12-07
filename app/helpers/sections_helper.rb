module SectionsHelper
  def get_option_list()

  end

  def update_rooms(params=nil)
    rooms = Room.all
    room_list = []
    room_list << ["None", nil]
    rooms.each { |r| room_list << r.to_arr_element if room_qualified?(r, params)}

    print room_list
    room_list
  end

  private

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
