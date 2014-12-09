class SectionsController < ApplicationController
  include SectionsHelper

	def new
    @section = Section.new
    @action = 'create'

    @room_props = Room.all_room_props

    @sets = get_option_list
    @sets[:course] = Course.find(params[:course_id]).to_arr_element
    @sets[:section] = nil
    @sets[:session] = 1
    @sets[:component] = "LEC"
    @sets[:class_nbr] = nil

    @disabled = generate_disable_hash(:new)
=begin
    @disabled = {}
    @disabled[:room] = false
    @disabled[:time] = false
    @disabled[:instructor] = false
    @disabled[:class_nbr] = false
    @disabled[:course] = true
    @disabled[:component] = false
    @disabled[:session] = false
=end
    @textbox_vals = get_tb_attributes
  end

  def cross
    @section = Section.find(params[:id])
    @action = 'create'

    @room_props = Room.all_room_props

    @sets = get_option_list

    @sets = get_section_data(@sets, @section)
=begin
    @disabled = {}
    @disabled[:room] = true
    @disabled[:time] = true
    @disabled[:instructor] = true
    @disabled[:class_nbr] = false
    @disabled[:course] = false
    @disabled[:component] = true
    @disabled[:session] = true
    @disabled[:section] = true
=end
    @disabled = generate_disable_hash(:cross)

    @textbox_vals = get_tb_attributes
  end

  def combine
    @section = Section.find(params[:id])
    @action = 'create'

    @room_props = Room.all_room_props

    @sets = get_option_list

    @sets = get_section_data(@sets, @section)
=begin
    @disabled = {}
    @disabled[:room] = true
    @disabled[:time] = true
    @disabled[:instructor] = true
    @disabled[:class_nbr] = false
    @disabled[:course] = true
    @disabled[:component] = true
    @disabled[:session] = true
    @disabled[:section] = false
=end
    @disabled = generate_disable_hash(:combine)
    @textbox_vals = get_tb_attributes
  end

  def add_instructor
    @section = Section.find(params[:id])
    @action = 'create'

    @room_props = Room.all_room_props

    @sets = get_option_list

    @sets = get_section_data(@sets, @section)

    @disabled = generate_disable_hash(:instructor)
=begin
    @disabled = {}
    @disabled[:room] = true
    @disabled[:time] = true
    @disabled[:instructor] = false
    @disabled[:class_nbr] = true
    @disabled[:course] = true
    @disabled[:component] = true
    @disabled[:session] = true
    @disabled[:section] = true
    @disabled[:sec_descr] = true
=end
    @textbox_vals = get_tb_attributes
  end

  def create
    valid = Section.create(section_params).valid?
    flash.notice = (valid ? "Section created successfuly" : "Section not created: Invalid")
    redirect_to (valid ? courses_path : new_section_path)
  end

  def edit
    @section = Section.find(params[:id])
    @action = 'update'

    @room_props = Room.all_room_props

    @sets = get_option_list

    @sets = get_section_data(@sets, @section)

    @disabled = generate_disable_hash(:edit)
=begin
    @disabled = {}
    @disabled[:room] = false
    @disabled[:time] = false
    @disabled[:instructor] = false
    @disabled[:class_nbr] = false
    @disabled[:course] = true
    @disabled[:component] = false
    @disabled[:session] = false
=end
    @textbox_vals = get_tb_attributes
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
