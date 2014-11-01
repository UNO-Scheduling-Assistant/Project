class CoursesController < ApplicationController
  include CoursesHelper
  include ApplicationHelper

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save

    redirect_to courses_path
  end

  def index
    @courses = Course.all.sort { |c1, c2| ("#{c1.subject}#{c1.course_id}" <=> "#{c2.subject}#{c2.course_id}") }

    @get_class = table_row_class_proc
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)

    redirect_to courses_path
  end

  def destroy
    Course.find(params[:id]).destroy
    redirect_to courses_path
  end
end
