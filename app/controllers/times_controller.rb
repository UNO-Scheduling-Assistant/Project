class TimesController < ApplicationController
  include TimesHelper
  def new
    @time = TimeSlot.new
    @hours = get_hour_hash
    @minutes = get_minute_hash
    @periods = get_period_hash
  end

  def create

  end

  def index
    @times = TimeSlot.all
    @instructors = get_time_instructors
    @sections = get_time_sections
    @get_class = table_row_class_proc
  end
end
