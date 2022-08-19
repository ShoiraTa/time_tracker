require 'rails_helper'

RSpec.describe 'Homepage' do 
  let(:admin_user){create(:admin_user)}
  let(:user){create(:user, :with_auditlog)}

  before do
    login_as(admin_user, :scope => :user)
  end
  describe 'homepage' do
    it 'admin, can approve post from homepage' do
      post = create(:post)
      visit root_path
      click_on("approval_#{post.id}")
      expect(post.reload.status).to eq('approved')
    end
    it 'employee, can approve auditlog from homepage' do
      logout(admin_user)
      login_as(user, :scope => :user)
      auditlog = user.auditlogs.last
       visit root_path
      click_on("confirm_#{auditlog.id}")
      expect(auditlog.reload.status).to eq('confirmed')
    end
  end
end