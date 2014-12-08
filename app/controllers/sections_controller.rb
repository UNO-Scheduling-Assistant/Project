class SectionsController < ApplicationController
  include SectionsHelper

	def new
    @section = Section.new
    @action = 'create'

    @room_props = Room.all_room_props

    @sets = get_option_list
    @sets[:course] = Course.find(params[:course_id]).to_arr_element
    @sets[:section] = nil
    @disabled = {}
    @disabled[:room] = false
    @disabled[:time] = false
    @disabled[:instructor] = false
    @disabled[:class_nbr] = false
    @disabled[:course] = true
  end

  def cross
  end

  def combine
  end

  def add_instructor
  end

  def create
    valid = Section.create(section_params).valid?
    flash.notice = (valid ? "Section created successfuly" : "Section not created: Invalid")
    redirect_to (valid ? courses_path : new_section_path)
  end

  def edit
  end

  def update
  end

  def destroy
    Section.find(params[:id]).destroy
    redirect_to courses_path
  end

  def update_list
    @new_sets = get_option_list(params)
    @disabled = {}
    @disabled[:room] = params[:room_disabled]
    @disabled[:time] = params[:time_disabled]
    @disabled[:instructor] = params[:instructor_disabled]

   # page["room"].replace_html partial: "pieces/room/room_num", locals: {rooms: @new_rooms}
  end
end
