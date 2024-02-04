class Transaction < ApplicationRecord
  belongs_to :client
  belongs_to :company

  validates :client, presence: true
end
