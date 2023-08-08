class Company < ApplicationRecord
  belongs_to :user

  validates :company_name, presence: true
  validates :owner_name, presence: true
  validates :owner_last_name,  presence: true
  validates :street, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :country, presence: true
  validates :tax_number, presence: true, { maximum: 10 }
  validates :regon, presence: true
  validates :phone_number, presence: true
end
