require 'rails_helper'

describe 'navigate' do
  let(:user){create(:user, :with_post)}
  let(:post){user.posts.first}

  before do
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

  describe 'new button on nav' do
    it 'opens new entry page' do
      visit root_path
      click_link('add_new_entry')
      expect(page.status_code).to eq 200
    end
    it 'can delete a post' do
      visit posts_path
      click_button("delete_post_#{post.id}")
      expect(page.status_code).to eq 200
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
  describe 'post edit' do
    it 'opens edit page' do
      visit posts_path
      click_link("edit_#{post.id}")
      expect(page.status_code).to eq 200
    end
    it 'updates the post' do
      visit edit_post_path(post)
      fill_in 'post[rationale]', with: 'edited'
      click_on 'Save'
      expect(page).to have_content('edited')
    end
  end
end