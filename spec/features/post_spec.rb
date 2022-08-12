require 'rails_helper'

RSpec.describe 'Posts' do 
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200) 
    end
    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/) 
    end
  end
  describe 'creation' do
    it 'has a form that can be reached' do
      visit new_post_path
      expect(page.status_code).to eq(200) 
    end
    it 'can be created from new page' do
      visit new_post_path
      fill_in "post[date]",	with: Date.today 
      fill_in "post[rationale]",	with: 'hello'
      click_on "Save"
      expect(page).to have_content('hello')
    end
  end
end