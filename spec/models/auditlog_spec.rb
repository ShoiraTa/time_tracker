require 'rails_helper'

RSpec.describe Auditlog, type: :model do
  describe 'Audit' do
    it 'can be created' do
      expect{create(:auditlog)}.to change(Auditlog, :count).by 1
    end
  end
end
