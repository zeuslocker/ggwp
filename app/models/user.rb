class User < ApplicationRecord
  belongs_to :tenant
  serialize :custom_field_values, Hash
end
