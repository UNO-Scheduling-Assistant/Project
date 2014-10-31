class HomeController < ApplicationController
  include HomeHelper

  def index

  end

  def import

  end

  def do_import
    read_csv(params[:import][:file])

    redirect_to '/'
  end

  def export

  end

  def list
    @report_table = Section.report_table_query
  end
end
