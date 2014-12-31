class AdminOnlyEditAdapter < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    :read == action || (user.try(:admin?))
  end
end
