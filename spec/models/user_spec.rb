require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){create(:user)}

  describe 'create' do
    it 'can create user' do
      expect(user).to be_valid
    end
  end
  describe 'methods' do
    it 'full_name method' do 
      expect(user.full_name).to eq("JON, SNOW")
    end
  end
  describe 'validation' do
    it 'can not create user without first_name last_name' do
      user.first_name = nil 
      user.last_name = nil 
      expect(user).to_not be_valid
    end
    it 'can not create user without a phone number' do
      user.phone_number = nil
      expect(user).to_not be_valid
    end
    it 'requires phone attr to only contain numbers' do
      user.phone_number = '1-2-3-4-5'
      expect(user).to_not be_valid
    end
    it 'requires phone attr to only contain 10 chars' do
      user.phone_number = '123456789'
      expect(user).to_not be_valid
    end
    it 'requires ssn' do
      user.ssn = nil
      expect(user).to_not be_valid
    end
    it 'requires a company' do
      user.company = nil
      expect(user).to_not be_valid
    end
    it 'requires phone attr to only contain numbers' do
      user.ssn = '1-2-3-4-5'
      expect(user).to_not be_valid
    end
  end

  describe 'relationship between admins and employees' do 
    it 'allows for admins to be assosiated with employees' do
      employee1 = create(:user)
      employee2 = create(:user)
      admin = create(:admin_user)
      Hand.create!(user_id: admin.id, hand_id: employee1.id)
      Hand.create!(user_id: admin.id, hand_id: employee2.id)
      expect(admin.hands.count).to eq 2
    end
  end
end
