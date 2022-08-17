require 'rails_helper'

RSpec.describe 'Approving posts' do 
  let(:admin_user) { create(:admin_user, :with_post) }
  let(:admin_post) { admin_user.posts.first } 

  let(:user) { create(:user, :with_post)}
  let(:user_post) {user.posts.last}

  before do 
    login_as(admin_user, :scope => :user)
    visit edit_post_path(admin_post)
  end

  describe 'approve' do
    it 'admin can select approve' do
        choose('post_status_approved')
        click_on 'Save'
        admin_post.reload
        expect(admin_post.status).to eq('approved')
    end
    context "non admin" do
      it 'cannnot select approve' do
        logout(:admin_user)
        login_as(user, :scope => :user)
        visit edit_post_path(user_post)
        expect(page).not_to have_content('Approved') 
      end
      it 'cannot edit approvaed post' do
        user_post.update(user_id: user.id, status: 'approved')
        logout(:admin_user)
        login_as(user, :scope => :user)
        visit edit_post_path(user_post)
        expect(current_path).to eq(root_path)
      end
    end
  end
end