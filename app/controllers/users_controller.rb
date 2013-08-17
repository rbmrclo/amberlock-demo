class UsersController < ApplicationController

  AMBERLOCK = Amberlock.new

  def show
    @user = User.find params[:id]
  end

  def enable
    @user = User.find params[:id]
    AMBERLOCK.subscribe_user(@user.mobile, @user.email)
    redirect_to user_path(@user)
  end

  def request_unlock_url
    @user = User.find params[:id]
    AMBERLOCK.request_unlock_url(@user.mobile, @user.email)
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      if params[:user][:mobile].present?
        @user.enabled = true
        @user.save!
        redirect_to user_path(@user)
      else
        @user.enabled = false
        @user.save!
        redirect_to user_path(@user)
      end
    else
      render 'edit'
    end
  end

end
