class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_one  :company, dependent: :destroy
end
