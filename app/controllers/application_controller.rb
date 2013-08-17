class ApplicationController < ActionController::Base
  protect_from_forgery


  def check_blocked?
    if session[:blocked].eql? true
      redirect_to amberlocked_path
    end
  end

end
