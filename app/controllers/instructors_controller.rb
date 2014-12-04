class InstructorsController < ApplicationController
  include InstructorsHelper
  include ApplicationHelper

  def new
    @instructor = Instructor.new
  end

  def create
    valid = Instructor.create(instructor_params).valid?
    flash.notice = (valid ? "Instructor created successfuly" : "Instructor not created: Invalid")
    redirect_to (valid ? instructors_path : new_instructor_path)
  end

  def index
    @instructors = Instructor.all

    @get_class = table_row_class_proc
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    @instructor.update(instructor_params)

    redirect_to instructors_path
  end

  def destroy
    Instructor.find(params[:id]).destroy
    redirect_to instructors_path
  end
end
