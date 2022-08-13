require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    it 'can be created' do
      post = Post.create(rationale: 'hello', date: Date.today)
      expect(post).to_not be_valid
    end
    it 'cannot be created without date and rationale' do
      post = Post.create()
      expect(post).to_not be_valid
    end
  end

end
