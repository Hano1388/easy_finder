class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :nullify

  validates :first_name, presence: true
      validates :last_name, presence: true

      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      validates :email, presence: true,
                        uniqueness: {case_sensitive: false},
                        format: VALID_EMAIL_REGEX
end
