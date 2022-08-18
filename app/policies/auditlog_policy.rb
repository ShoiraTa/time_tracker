class AuditlogPolicy < ApplicationPolicy
  def index?
    return true if admin?
  end

  private
  def admin?
    @user.type == 'AdminUser'
  end
end