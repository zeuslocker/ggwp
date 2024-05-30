class Tenant < ApplicationRecord
  has_many :custom_fields
  has_many :users
end
