class Post < ApplicationRecord
  enum status: [ :submitted, :approved, :rejected ]
  validates_presence_of :date, :rationale
  belongs_to :user
end
