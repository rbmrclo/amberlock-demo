class SessionsController < Devise::SessionsController
  protected
  
  AMBERLOCK = Amberlock.new

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
