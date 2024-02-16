class Transaction < ApplicationRecord
  belongs_to :client
  belongs_to :company

  validates :client, presence: true
  validates :policyno, presence: true, uniqueness: false
end
