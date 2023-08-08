class Company < ApplicationRecord
  belongs_to :user
  validates :company_name, :owner_name, :owner_last_name, :street, :postal_code, 
            :city, :province, :country, :tax_number, :regon, :phone_number, presence: true
  validates :postal_code, length: { maximum: 6 }
  validates :street, length: { maximum: 255 }
end
