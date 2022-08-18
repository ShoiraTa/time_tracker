require 'rails_helper'

RSpec.describe Auditlog, type: :model do
  let(:auditlog){create(:auditlog)}
  describe 'Audit' do
    it 'can be created' do
      expect{create(:auditlog)}.to change(Auditlog, :count).by 1
    end
  end
  describe 'Validations' do
    it 'start date should be required'do 
      auditlog.start_date = nil
      expect(auditlog).to_not be_valid
    end

    it 'user assosiation should be required'do 
      auditlog.user_id = nil
      expect(auditlog).to_not be_valid
    end
    it 'should always have a status'do 
      auditlog.status = nil
      expect(auditlog).to_not be_valid
    end

  end
end
