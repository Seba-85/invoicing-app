class AddressesController < ApplicationController
  before_action :find_user, only: %i[new edit update create destroy]
  before_action :set_address, only: %i[edit update destroy]
  
  def new; end

  def show; end

  def edit; end

  def create
    @address = @user.addresses.new(address_params)

    if @address.save
      redirect_to user_path(@user), notice: 'Adres został prawidłowo dodany'
    else
      render :new, status: :unprocessable_entity

      flash[:alert] = 'Wystąpił błąd podczas dodawania adresu.'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(@user),  notice: 'Adres został prawidłowo edytowany'
    else
      render :edit

      flash[:alert] = 'Wystąpił błąd podczas edycji adresu.'
    end
  end

  def destroy
    if @address.destroy
      redirect_to user_path(@user), notice: 'Adres został prawidłowo usunięty'
    else
      flash[:alert] = 'Wystąpił błąd podczas usuwania adresu.'
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def set_address
    @address = @user.addresses.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :country, :postal_code)
  end
end
