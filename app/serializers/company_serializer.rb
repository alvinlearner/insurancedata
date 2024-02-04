class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :rate, :excessprotector, :pvt, :lossofuse, :pcf, :itl, :stampduty
end
