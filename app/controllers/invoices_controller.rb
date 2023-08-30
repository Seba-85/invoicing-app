class InvoicesController < ApplicationController
  before_action :find_user
  before_action :set_invoice, only: %i[edit show update destroy]

  def index
    @invoices = @user.invoices
  end

  def new; end

  def edit; end

  def show
    @client = @user.clients.find(@invoice.client_id)
  end

  def create
    @invoice = @user.invoices.new(invoice_params)

    if @invoice.save
      redirect_to user_invoice_path(@user, @invoice), notice: 'Faktura została prawidłowo utworzona'
    else
      render :new, status: :unprocessable_entity

      flash[:alert] = 'Wystąpił błąd podczas dodawania danych.'
    end
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to user_invoice_path(@user, @invoice), notice: 'Faktura została prawidłowo edytowana'
    else
      render :edit

      flash[:alert] = 'Wystąpił błąd podczas edycji danych.'
    end
  end

  def destroy
    if @invoice.destroy
      redirect_to user_invoices_path(@user, @invoice), notice: 'Faktura została prawidłowo usunięta'
    else
      flash[:alert] = 'Wystąpił błąd podczas usuwania faktury.'
    end
  end

private

  def find_user
    @user = User.find(params[:user_id])
  end

  def set_invoice
    @invoice = @user.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:client_id, :place_of_issue, :date_of_issue, :date_of_payment, :product_name, :unit, :net_price, :net_value, :vat_rate, :amount_of_vat, :gross_value, :quantity) 
  end
end
