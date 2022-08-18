require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){User.create(email:'email@gmail.com', password: '123456', password_confirmation: '123456', last_name: 'Last',first_name: 'Nina', phone_number: '995551113368')}

  describe 'Create' do
    it 'can create user' do
      expect(user).to be_valid
    end
    it 'can not create user without first_name last_name' do
      user.first_name = nil 
      user.last_name = nil 
      expect(user).to_not be_valid
    end
    it 'can not create user without a phone number' do
      user.phone_number = nil
      expect(user).to_not be_valid
    end
  end
  describe 'user methods' do
    it 'full_name method' do 
      expect(user.full_name).to eq('NINA, LAST')
    end
  end
end
