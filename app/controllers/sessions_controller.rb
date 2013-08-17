class SessionsController < Devise::SessionsController
  protected


  def after_sign_in_path_for(resource)
    artists_path
  end

end
