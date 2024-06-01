class Tenant < ApplicationRecord
  has_one :custom_field
  has_many :users
end
