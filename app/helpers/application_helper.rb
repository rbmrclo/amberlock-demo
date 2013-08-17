module ApplicationHelper

  def enable_or_not
    case current_user.enabled
    when true
      "Enabled"
    when false
      "Disabled"
    end
  end
end
