class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :place_of_issue, presence: true
  validates :date_of_issue, presence: true
  validates :date_of_payment,  presence: true
  validates :product_name, presence: true
  validates :unit, presence: true
  validates :net_price, presence: true
  validates :net_value, presence: true
  validates :vat_rate, presence: true
  validates :amount_of_vat, presence: true
  validates :gross_value, presence: true
  validates :quantity, presence: true
end
