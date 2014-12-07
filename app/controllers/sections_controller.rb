class SectionsController < ApplicationController
  include SectionsHelper

	def new
    @section = Section.new
    @action = 'create'

    @room_props = Room.all_room_props

    @update_room = Proc.new do |var|
      @rooms = update_rooms(board: "W")
    #  render :new do |page|
     #   page.replace_html('room', partial: 'sections/pieces/room/room_num', rooms: @rooms)
     # end
    end

    @rooms = update_rooms
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
    @new_rooms = update_rooms(params)

   # page["room"].replace_html partial: "pieces/room/room_num", locals: {rooms: @new_rooms}
  end
end
