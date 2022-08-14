require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do 
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
    end
    describe 'post creation' do
      it 'can be created' do
        post = Post.create(rationale: 'hello', date: Date.today, user: User.first)
        expect(post).to be_valid
      end
      it 'cannot be created without date and rationale' do
        post = Post.create()
        expect(post).to_not be_valid
      end
    end

  end

end
