class AddressesController < ApplicationController
  before_action :find_user, only: %i[new edit update create destroy]
  before_action :set_address, only: %i[edit update destroy]
  
  def new; end

  def show; end

  def edit; end

  def update
    if @address.update(address_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @address = @user.addresses.new(address_params)

    if @address.save
    redirect_to user_path(@user)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy
    
    redirect_to user_path(@user)
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
