class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_one :company, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :invoices, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true, length: { minimum: 6, maximum: 24 }
end
