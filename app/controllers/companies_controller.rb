class CompaniesController < ApplicationController
  PROSPECTS_PER_PAGE = 20
  def index
    @company = Company.find(params[:id])
    @all_clients = Prospect.where(company: @company)
    
    @table_fields = ["First Name", "Last Name", "Email", "Stage", "Phone", "Company", "Probability", "Edit", "Delete"]

    @current_page = params[:page].to_i
    @current_page = 1 if @current_page < 1

    @total_prospects = @all_clients.count
    @total_pages = (@total_prospects.to_f / PROSPECTS_PER_PAGE).ceil

    @prospects = @all_clients.limit(PROSPECTS_PER_PAGE).offset((@current_page - 1) * PROSPECTS_PER_PAGE)
  end

  def create
    if Company.create(company_params)
      flash[:success] = "Company created"
    else
      flash.now[:error] = "Could not create."
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:success] = "Company updated successfully."
      redirect_to request.referrer
    else
      flash.now[:error] = "Could not update."
      redirect_to request.referrer
    end
  end

  def destroy
    company = Company.find(params[:id])
    if Prospect.where(company: @company).present?
      flash[:error] = "Can't destroy while there is users on the company"
      redirect_to request.referrer
    elsif company.destroy
      flash[:success] = "Company detroyed"
      redirect_to '/prospects/1'
    else
      flash.now[:error] = "Could not destroy."
      redirect_to request.referrer
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end