class User < ApplicationRecord

	has_many :products
	has_many :purchases

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "first_name", "id", "last_name", "mobile_no", "password", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["products", "purchases"]
  end
end
