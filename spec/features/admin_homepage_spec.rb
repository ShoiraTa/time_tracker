require 'rails_helper'

RSpec.describe 'Homepage' do 
  let(:admin_user){create(:admin_user)}

  before do
    login_as(admin_user, :scope => :user)
  end
  describe 'admin' do
    it 'can approve post from homepage' do
      post = create(:post)
      visit root_path
      click_on("approval_#{post.id}")
      expect(post.reload.status).to eq('approved')
    end
  end
end