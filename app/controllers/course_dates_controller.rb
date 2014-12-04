class CourseDatesController < ApplicationController
  include DatesHelper
  include ApplicationHelper
  def new
    @date = CourseDate.new
    @year_hash = get_year_hash
    @month_hash = get_month_hash
    @day_hash = get_day_hash
  end

  def create
    start_date = get_sdate(params)
    end_date = get_edate(params)

    @date = CourseDate.new(start_date: start_date, end_date: end_date)
    @date.save
    
    redirect_to course_dates_path
  end

  def index
    @dates = CourseDate.all
    @get_class = table_row_class_proc
  end

  def edit
    @date = CourseDate.find(params[:id])

    @year_hash = get_year_hash
    @month_hash = get_month_hash
    @day_hash = get_day_hash

    params = split_date_params(@date)
  end

  def update

  end
end
