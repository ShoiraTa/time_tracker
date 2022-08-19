class Auditlog < ApplicationRecord
  enum status:[ :pending, :confirmed]
  belongs_to :user
  validates_presence_of :start_date, :status

  after_initialize :set_defaults

  private 

  def set_defaults
    self.start_date ||= Date.today -6.days
  end
end
