class Post < ApplicationRecord
  enum status: [ :submitted, :approved, :rejected ]
  validates_presence_of :date, :rationale
  belongs_to :user

  validates :overtime_hours, numericality: { greater_than: 0.0 }
  scope :posts_by, ->(user) {where('user_id = ?', user.id)}
end
