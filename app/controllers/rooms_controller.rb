class RoomsController < ApplicationController
  include RoomsHelper
  include ApplicationHelper

  def new
    @room = Room.new
  end

  def create
    valid = Room.create(room_params).valid?
    flash.notice = (valid ? "Room created successfuly" : "Room not created: Invalid")
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
    @room.update(room_params)

    redirect_to rooms_path
  end

  def destroy
    Room.find(params[:id]).destroy
    redirect_to rooms_path
  end
end
