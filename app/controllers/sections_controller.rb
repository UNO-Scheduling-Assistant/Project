class SectionsController < ApplicationController
  include SectionsHelper

	def new
    @section = Section.new
    @action = 'create'

    @room_props = Room.all_room_props

    @sets = get_option_list

    @disabled = {}
    @disabled[:room] = false
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

  def update_room_list
    @new_sets = get_option_list(params)
    @disabled = params[:disabled]

   # page["room"].replace_html partial: "pieces/room/room_num", locals: {rooms: @new_rooms}
  end
end
