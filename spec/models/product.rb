require 'rails_helper'
RSpec.describe Product, type: :model do
	describe 'associations' do 
		it{ should belong_to(:user)}
		it{ should belong_to(:category)}
	end

	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:price) }
		it { should validate_presence_of(:description) }
	end

	describe 'enums' do 
		it do
      should define_enum_for(:status).
        with_values(
          available: "available",
          sold: "sold"
        ).
        backed_by_column_of_type(:string)
      end
	end

	describe 'has_one_attached' do
    it { should have_one_attached(:product_image) }	
	end

end