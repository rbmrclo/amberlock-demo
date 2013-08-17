class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :check_blocked?, only: :show

  AMBERLOCK = Amberlock.new

  def show
    @user = User.find params[:id]
  end

  def enable
    @user = User.find params[:id]
    AMBERLOCK.subscribe_user(@user.mobile, @user.email)
  end

  def request_unlock
    @user = User.where(id: session["warden.user.user.key"][0]).first
    @response = AMBERLOCK.request_unlock(@user.mobile, @user.email)
    parsed = JSON.parse(@response)
    session[:unlock_code] = parsed["amber_code"]
    redirect_to amberlocked_path
  end

  def verify_unlock 
    if params[:unlock_code] == session[:unlock_code]
      session[:blocked] = false
      redirect_to artists_path
    else
      render json: { status: 'failed', message: 'incorrect unlock code'}
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def add_mobile
    @user = User.find params[:id]
    if @user.subscribe!(params[:mobile])
      render json: { status: 'success' }
    end
  rescue RestClient::UnprocessableEntity
    render json: { status: 'success' }
  end

end
