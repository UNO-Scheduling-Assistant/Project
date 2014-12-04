class RoomsController < ApplicationController
  include RoomsHelper
  include ApplicationHelper

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    valid = @room.save
    flash.notice = (valid ? "Room created successfuly" : "Room not created: #{errors(@room)}")
    redirect_to (valid ? rooms_path : new_room_path)
  end

  def index
    @rooms = Room.all

    @get_class = table_row_class_proc
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    valid = @room.update(room_params)

    flash.notice = (valid ? "Room updated successfuly" : "Room not updated: #{@room.errors.full_messages[0]}")
    redirect_to (valid ? rooms_path : edit_room_path(params[:id]))
  end

  def destroy
    Room.find(params[:id]).destroy
    redirect_to rooms_path
  end
end
