class CompaniesController < ApplicationController
  def index
    @company = Company.find(params[:id])
    @all_clients = Prospect.where(company: @company)
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
    if company.destroy
      flash[:success] = "Company detroyed"
      redirect_to request.referrer
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