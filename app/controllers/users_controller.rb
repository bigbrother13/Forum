class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  before_action :check_authoriztion, only: [:edit, :update]
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.new[:alert] = 'Somthing went wrong. Pleace try again'
      render 'edit'
    end
  end

  private

  def check_authoriztion
    unless current_user.id == params[:id].to_i
      redirect_to root_url      
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user)
  end
end
