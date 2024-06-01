class User < ApplicationRecord
  belongs_to :tenant
  serialize :custom_field_values, Hash

  validates :name, presence: true
  validates :tenant, presence: true
end
