# require 'rails_helper'
FactoryBot.define do
  factory :product , class: Product do  
    name {'Laptop'}
    price {35000} 
    description { "this is newly laptop"}
    association :category, factory: :category
    association :user, factory: :user
    # product_image {fixture_file_upload(Rails.root.join("spec/support/images/ghar.jpeg"),'image/jpeg')}
    # product_image {Rack::Test::UploadedFile.new(Rails.root.join("spec/support/images/ghar.jpeg"),'image/jpeg')}

  end
end

