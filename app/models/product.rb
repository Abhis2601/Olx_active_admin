class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one :purchase


  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "purchase", "user"]
  end
end
