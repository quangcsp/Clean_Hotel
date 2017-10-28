module ApplicationHelper
  def current_user? user
    current_user && user.id == current_user.id
  end
end
