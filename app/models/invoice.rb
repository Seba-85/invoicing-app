class Invoice < ApplicationRecord
  belongs_to :user
  has_one :client
end
