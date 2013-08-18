class SessionsController < Devise::SessionsController
  protected

  AMBERLOCK = Amberlock::Amber.new('rPLqG41JuX2k8hC2woZq','DA-54ad0e02e5df')

  def after_sign_in_path_for(resource)
    if current_user.enabled.eql? true
      session[:blocked] = true
      session[:user_id] = current_user.id
      amberlocked_path
    else
      artists_path
    end
  end

end
