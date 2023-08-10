class ClientsController < ApplicationController
  before_action :find_user
  before_action :set_client, only: %i[edit show update destroy]

  def index
    @clients = @user.clients
  end
 
  def new; end

  def show;end

  def edit; end


  def create
    @client = @user.clients.new(client_params)

    if @client.save
      redirect_to user_client_path(@user, @client), notice: 'Dane klienta zostały prawidłowo dodane'
    else
      render :new, status: :unprocessable_entity

      flash[:alert] = 'Wystąpił błąd podczas dodawania danych.'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to user_client_path(@user, @client),  notice: 'Dane klienta zostały prawidłowo edytowane'
    else
      render :edit

      flash[:alert] = 'Wystąpił błąd podczas edycji adresu.'
    end
  end

  def destroy
    if @client.destroy
    
      redirect_to user_clients_path(@user), notice: 'Dane klienta zostały prawidłowo usunięte'
    else
      flash[:alert] = 'Wystąpił błąd podczas usuwania adresu.'
    end
  end


  
  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def set_client
    @client = @user.clients.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:company_name, :owner_name, :owner_last_name, :street, :postal_code, :city, :province, :country, :tax_number, :regon, :email) 
  end
end
