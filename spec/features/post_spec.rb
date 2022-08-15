require 'rails_helper'

describe 'navigate' do
  before do
    user = create(:user)
    login_as(user, :scope => :user)
    visit new_post_path
  end
  describe 'index' do
    before do
      visit posts_path
    end
  	it 'can be reached successfully' do
  		expect(page.status_code).to eq(200)
  	end
  	it 'has a title of Posts' do
  		expect(page).to have_content(/Posts/)
  	end
  end

  describe 'posts index page' do
    it 'shows created posts' do
      create(:post)
      visit posts_path
      expect(page).to have_content(/post 1/)
    end
  end
  describe 'creation' do
  	it 'has a new form that can be reached' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
  	end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end