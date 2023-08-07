class CompaniesController < ApplicationController
  before_action :find_user, only: %i[new edit update create destroy]

  def new; end

  def edit; end

  def update
    if @user.company.update(company_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @company = @user.create_company(company_params)

    if @company.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.company.destroy
    
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
  
  def set_company
    @company = @user.company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:company_name, :owner_name, :owner_last_name, :street, :postal_code, 
    :city, :province, :country, :tax_number, :regon, :phone_number)
  end
end
