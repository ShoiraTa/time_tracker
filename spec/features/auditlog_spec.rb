require 'rails_helper'

RSpec.describe 'Auditlog features' do 
  let(:admin_user){create(:admin_user)}
  let(:user){create(:user)}
  let(:auditlog){create(:auditlog)}
  before do 
    login_as(admin_user, :scope => :user)
  end
  describe 'index' do
    it 'has an index page that can be reached' do
      visit auditlogs_path
      expect(page.status_code).to eq(200)
    end
    it 'non admin cannot access audilogs' do
      logout(:admin_user)
      login_as(user, :scope=> :user)
      visit auditlogs_path
      expect(current_path).to eq(root_path)
    end
  end
end