class CompaniesController < ApplicationController
  before_action :find_user, only: %i[new edit update create destroy]

  def new; end

  def edit; end

  def create
    @company = @user.create_company(company_params)

    if @company.save
      redirect_to user_path(@user), notice: 'Dane firmy zostały prawidłowo dodane'
    else
      render :new, status: :unprocessable_entity

      
      flash[:alert] = 'Wystąpił błąd podczas dodawania danych.'
    end
  end

  def update
    if @user.company.update(company_params)
      redirect_to user_path(@user), notice: 'Dane firmy zostały prawidłowo edytowane'
    else
      render :edit

      flash[:alert] = 'Wystąpił błąd podczas edycji danych.'
    end
  end

  def destroy
    if @user.company.destroy
    
    redirect_to user_path(@user), notice: 'Dane firmy zostały prawidłowo usunięte'
    else
      flash[:alert] = 'Wystąpił błąd podczas usuwania danych.'
    end
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
