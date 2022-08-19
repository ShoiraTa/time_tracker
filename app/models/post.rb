class Post < ApplicationRecord
  enum status: [ :submitted, :approved, :rejected ]
  validates_presence_of :date, :rationale
  belongs_to :user

  validates :overtime_hours, numericality: { greater_than: 0.0 }
  scope :posts_by, ->(user) {where('user_id = ?', user.id)}
  after_save :update_audit_log

  private
  def update_audit_log
    auditlog = Auditlog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    auditlog && auditlog.confirmed!
  end
end
