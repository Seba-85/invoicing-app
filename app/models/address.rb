class Address < ApplicationRecord
  belongs_to :user
  validates :street, :city, :state, :country, :postal_code, presence: true
  validates :postal_code, length: { maximum: 6 }
  validates :street, length: { maximum: 255 }
end
