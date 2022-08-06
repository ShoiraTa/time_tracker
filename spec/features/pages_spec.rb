require 'rails_helper'

RSpec.describe 'Pages' do 
  describe 'homepage' do
    it 'page exists' do
      visit root_path
      expect(page.status_code).to eq(200) 
    end
  end
end