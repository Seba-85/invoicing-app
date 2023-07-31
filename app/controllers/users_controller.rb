class UsersController < ApplicationController
  before_action :set_user, only: %i[show, edit, update, destroy]

  def index
   @users = User.all
  end

  def new
   @user = User.new
  end

  def show; end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
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
    ensure
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
