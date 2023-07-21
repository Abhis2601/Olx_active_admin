class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description
  belongs_to :category
  belongs_to :user
end
