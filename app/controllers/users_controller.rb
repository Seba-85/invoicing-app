class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
   @users = User.all
  end

  def new
   @user = User.new
  end

  def show
    @presenter = CompanyPresenter.new(@user)
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Użytkownik został prawidłowo dodany'
    else
      render :new

      flash[:alert] = "Wystąpił błąd podczas dodawania użytkownika."
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy

    redirect_to root_path, status: 303
  end

  private
   
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
