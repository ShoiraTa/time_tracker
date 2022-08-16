require 'rails_helper'

RSpec.describe 'Approving posts' do 
  let(:admin_user) { create(:admin_user, :with_post) }
  let(:post) { admin_user.posts.first } 
  before do 
    login_as(admin_user, :scope => :user)
  end
  describe 'approve' do
    it 'admin can select approve' do
       puts post.user.id, admin_user.id
        visit edit_post_path(post)
        choose('post_status_approved')
        click_on 'Save'
        post.reload
        expect(post.status).to eq('approved'), post 
    end
    it 'non-admin cannnot select approve' do
        logout(:user)
        user = create(:user, :with_post)
        post = user.posts.first
        login_as(user, :scope => :user)
        visit edit_post_path(post)
        expect(page).not_to have_content('Approved') 
    end
  end
end