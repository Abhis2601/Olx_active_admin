class PurchaseSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :product
  belongs_to :user
end
