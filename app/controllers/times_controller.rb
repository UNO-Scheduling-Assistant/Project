class TimesController < ApplicationController
  include TimesHelper
  def new
    @time = TimeSlot.new
    @hours = get_hour_hash
    @minutes = get_minute_hash
    @periods = get_period_hash
  end

  def create
    days = get_days(params)
    stime = get_stime(params)
    etime = get_etime(params)

    @time = TimeSlot.new(days: days, 
                         start_time_hour: stime[:hour], 
                         start_time_minute: stime[:minute], 
                         end_time_hour: etime[:hour], 
                         end_time_minute: etime[:minute])
    @time.save
    
    redirect_to times_path
  end

  def index
    @times = TimeSlot.all
    @instructors = get_time_instructors
    @sections = get_time_sections
    @rooms = get_time_rooms

    @get_class = table_row_class_proc
  end
end
