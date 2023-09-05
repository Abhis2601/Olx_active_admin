require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
	let(:category){ FactoryBot.create(:category)}
	describe "#action" do 

		describe "#index" do

			context " all category " do 
				it "return all category_name" do
					get :index
					expect(response).to have_http_status :ok
				end
			end

		end
	end
end
