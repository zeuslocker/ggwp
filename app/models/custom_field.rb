class CustomField < ApplicationRecord
  belongs_to :tenant
  enum field_type: { text: 0, number: 1, single_select: 2, multiple_select: 3 }

  validates :tenant, presence: true
end
