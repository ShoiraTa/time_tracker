class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PHONE_NUMBER_REGEX = /\A[0-9]*\Z/
  validates_format_of :phone_number, with: PHONE_NUMBER_REGEX
  validates :phone_number, length: {minimum: 10}

  validates_presence_of :first_name, :last_name, :phone_number

  has_many :posts

  def full_name
    first_name.upcase + ', ' + last_name.upcase
  end
end
