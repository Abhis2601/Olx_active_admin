class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name ,:email
  has_many :products
  has_many :purchases
end
