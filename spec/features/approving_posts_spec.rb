require 'rails_helper'

RSpec.describe 'Approving posts' do 
  before do 
    @admin_user = create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end
  describe 'approve' do
    before do 
      @post = create(:post)
    end
    it 'can select' do
      visit edit_post_path(@post)
       choose('post_status_approved')
       click_on 'Save'
       @post.reload
       expect(@post.status).to eq('approved') 
    end
  end
end