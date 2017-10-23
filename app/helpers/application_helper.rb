module ApplicationHelper
  def current_user? user
    user.id == current_user.id
  end
end
