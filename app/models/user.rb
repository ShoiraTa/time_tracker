class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone_number
  has_many :posts

  def full_name
    first_name.upcase + ', ' + last_name.upcase
  end
end
