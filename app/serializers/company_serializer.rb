class CompanySerializer < ActiveModel::Serializer
  attributes :id, :organization, :rate, :excessprotector, :pvt, :lossofuse, :pcf, :itl, :stampduty
end
