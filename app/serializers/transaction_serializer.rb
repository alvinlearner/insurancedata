class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :policyno, :reg, :proposed, :start, :expire, :classification
  has_one :client
  has_one :company
end
