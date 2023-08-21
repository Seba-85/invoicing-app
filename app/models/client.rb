class Client < ApplicationRecord
  belongs_to :user
  belongs_to :invoices

  validates :company_name, presence: true
  validates :owner_name, presence: true
  validates :owner_last_name,  presence: true
  validates :street, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :country, presence: true
  validates :tax_number, presence: true, length: { is: 10 } 
  validates :regon, presence: true
  validates :email, presence: true
end
