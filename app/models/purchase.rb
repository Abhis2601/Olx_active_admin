class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # def self.ransackable_attributes(auth_object = nil)
  #   ["created_at", "id", "product_id", "updated_at", "user_id"]
  # end
end
