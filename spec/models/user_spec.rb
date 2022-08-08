require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){User.create(email:'email@gmail.com', password: '123456', password_confirmation: '123456', last_name: 'Last',first_name: 'Nina')}
  describe 'Create' do
    it 'can create user' do
      expect(user).to be_valid
    end
    it 'can not create user without first_name last_name' do
      user.first_name = nil 
      user.last_name = nil 
      expect(user).to_not be_valid
    end
  end
end
