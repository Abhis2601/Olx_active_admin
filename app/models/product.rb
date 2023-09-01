class Product < ApplicationRecord
  validates :name, :description, :price, :alphanumeric_id, presence: true
  belongs_to :category
  belongs_to :user
  has_one :purchase
  has_one_attached :product_image
  enum status: { available:"available", sold:"sold" }
  # def self.ransackable_attributes(auth_object = nil)
  #   ["category_id", "created_at", "alphanumeric_id","status","description", "id", "name", "price", "updated_at", "user_id"]
  # end

  # def self.ransackable_associations(auth_object = nil)
  #   ["category", "purchase", "user"]
  # end
end
