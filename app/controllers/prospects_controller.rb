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

  def edit
    @prospect = Prospect.find_by(id: params[:id])
    @stages = Stage.all
    @companies = Company.order('name ASC')

  end

  def update
    @prospect = Prospect.find(params[:id])
    if @prospect.update(prospect_params)
      flash[:success] = "Client updated successfully."
    else
      flash.now[:error] = "Could not update."
    end
  end

  private

  def prospect_params
    params.require(:prospect).permit(:first_name, :last_name, :email, :phone, :probability, :company_id, :stage_id)
  end
 
end