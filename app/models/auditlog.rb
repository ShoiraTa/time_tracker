class Auditlog < ApplicationRecord
  enum status:[ :pending, :confirmed]
  belongs_to :user
  validates_presence_of :start_date, :status

  after_initialize :set_defaults
  before_update :set_end_date, if: :confirmed?
  
  private 
  def set_end_date
    self.end_date = Date.today
  end
  def set_defaults
    self.start_date ||= Date.today -6.days
  end
end
