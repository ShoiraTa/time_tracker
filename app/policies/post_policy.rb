class PostPolicy < ApplicationPolicy
  def edit?
    @record.user.id == user.id || @user.type == 'AdminUser'
  end
  def update?
    @record.user.id == user.id || @user.type == 'AdminUser'
  end
end