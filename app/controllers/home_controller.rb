class HomeController < ApplicationController
  include HomeHelper

  def index

  end

  def import

  end

  def do_import
    read_csv(params[:import][:file])

    flash.notice = "Successfully imported data"
    redirect_to '/'
  end

  def export

  end

  def list
    @report_table = Section.report_table_array
  end

  def delete_all
    Section.destroy_all
    Course.destroy_all
    SectionSetting.destroy_all
    TimeSlot.destroy_all
    Instructor.destroy_all
    Room.destroy_all
    CourseDate.destroy_all

    flash.notice = "Deleted all data"
    redirect_to '/'

  end
end
