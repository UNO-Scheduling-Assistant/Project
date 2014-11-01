class RoomsController < ApplicationController
  include RoomsHelper

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save

    redirect_to rooms_path
  end

  def index
    @rooms = Room.all

    @get_class = Proc.new {|n| n % 2 == 0 ? "even" : "odd" }
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
