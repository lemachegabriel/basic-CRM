class ProspectsController < ApplicationController
  PROSPECTS_PER_PAGE = 20
  
  def index
    @table_fields = ["First Name", "Last Name", "Email", "Stage", "Phone", "Company", "Probability", "Edit", "Delete"]

    @current_page = params[:page].to_i
    @current_page = 1 if @current_page < 1

    @total_prospects = Prospect.count
    @total_pages = (@total_prospects.to_f / PROSPECTS_PER_PAGE).ceil

    @prospects = Prospect.limit(PROSPECTS_PER_PAGE).offset((@current_page - 1) * PROSPECTS_PER_PAGE)
  end
end