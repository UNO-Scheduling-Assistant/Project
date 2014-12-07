class SectionsController < ApplicationController
	def new
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
end
