class User < ApplicationRecord
  has_many  :addresses, dependent: :destroy
  has_one   :company, dependent: :destroy
  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password_digest, length: { minimum: 6 }
end
