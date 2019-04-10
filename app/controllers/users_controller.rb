class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  before_action :set_user
  before_action :authenticate_user!, except: %i(show)

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, alert: 'Could not update, Please try again'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :avatar)
  end
end
