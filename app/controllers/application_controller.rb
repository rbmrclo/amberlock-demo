class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :amberlock_block!

  def amberlock_block!

  end

end
