class PostPolicy < ApplicationPolicy
  def update?
    return true if approved? && admin?
    return true if author_or_admin?  && !approved?
  end
  def approve?
    return true if admin?
  end
  def edit?
    return true if approved? && admin?
    return true if author_or_admin?  && !approved?
  end

  private
  def admin?
    @user.type == 'AdminUser'
  end
  def author_or_admin? 
    @record.user.id == user.id || @user.type == 'AdminUser'
  end
  def approved?
    record.approved?
  end

end