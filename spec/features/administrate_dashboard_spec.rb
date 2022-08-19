require 'rails_helper'

RSpec.describe 'Admin dashboard' do 
  describe 'access' do
    it 'opens successfully' do
      visit admin_root_path
      expect(page.status_code).to eq(200) 
    end
    it 'does not allow access users that are not signed in' do
      visit admin_root_path
      expect(current_path).to eq(new_user_session_path) 
    end
    it 'does not allow access users that are admin' do
      user = create(:user)
      login_as(user, :scope => :user)
      visit admin_root_path
      expect(current_path).to eq(root_path) 
    end

    it 'allows access users that are admin' do
      admin_user = create(:admin_user)
      login_as(admin_user, :scope => :user)
      visit admin_root_path
      expect(current_path).to eq(admin_root_path) 
    end
  end
end