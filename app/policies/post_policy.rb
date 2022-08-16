class PostPolicy < ApplicationPolicy

  def edit?
    @record.user == @user || user.type == 'AdminUser'
  end
end