require 'rails_helper'

	include JsonWebToken

RSpec.describe ProductsController, type: :controller do
	let(:user) {FactoryBot.create(:user)}
	let(:product) {FactoryBot.create(:product)}
	let(:category) {FactoryBot.create(:category)}
	 
	before(:each) do
		@token = jwt_encode(user_id: user.id)
	end
	# let(:token) { jwt_encode(user_id: user.id) }
	let(:authenticate_user) do
		request.headers['Authorization'] = "#{@token}"
	end

		describe 'POST #create' do

			context 'without token' do
				it 'Returns unauthorized user ' do 
					post :create 
          expect(response).to have_http_status :unauthorized
				end
			end
				
			context 'with incorrect params' do
				it 'Returns unprocessable_entity ' do
					authenticate_user
					post :create , params:{
  							name:"Laptop",
							 	description:"this is newly laptop",
							 	category_id:category.id, 
							 	user_id:user.id
						}
          expect(response).to have_http_status :unprocessable_entity
				end
				

			context 'with correct params' do

				it 'Returns product created ' do
					authenticate_user
					post :create ,
						params:{
							name:"Laptop",
							price:35000,
							 description:"this is newly laptop",
							 category_id:category.id, 
							 user_id:user.id
						}
          expect(response).to have_http_status :created
				end
			end


			end
		end	


		describe '#index' do 

			context 'without token' do 
				it'Returns unauthorized user ' do 
					get :index 
					expect(response).to have_http_status :unauthorized
				end
			end

			context 'with token ' do
				context 'with no params' do				
					it 'Returns all available product' do 
						authenticate_user
						get :index
						expect(response).to have_http_status :ok
					end
				end

				context 'with name params' do				
					it 'Returns all product which is name like params name ' do 
						authenticate_user
						get :index,
						params:{name:product.name}
						expect(response).to have_http_status :ok
					end
				end

				context 'with name params' do				
					it 'Returns all product which is name do not like params name  ' do 
						authenticate_user
						get :index,
						params:{name:"abc"}
						expect(response).to have_http_status :not_found
					end
				end

				context 'with category_name params' do				
					it 'Returns all product which is category like params category_name ' do 
						authenticate_user
						get :index,
						params:{category_name:category.category_name}
						expect(response).to have_http_status :ok
					end
				end


				context 'with category_name params' do				
					it 'Returns all product which is name do not like params category_name  ' do 
						authenticate_user
						get :index,
						params:{category_name:"abc"}
						expect(response).to have_http_status :not_found
					end
				end

			end
		end


		describe '#current_user_products' do 

		# 	context 'without token' do 
		# 		it 'Returns unauthorized user' do
		# 			get :current_user_products
		# 			expect(response).to have_http_status :unauthorized
		# 		end
		# 	end

			context 'with token' do 
			  context 'current user has no products' do 
			  	it 'Returns no product found' do 
			  		authenticate_user
			  		get :current_user_products
			  		expect(response).to have_http_status :not_found
			  	end
			  end

				context 'current user has products' do 
		  		it 'Returns all product of current user which status is available' do 
			  		authenticate_user
			  		products = FactoryBot.create(:product, user_id:user.id)
			  		get :current_user_products
			  		expect(response).to have_http_status :ok
			  	end
			  end

			end
		end

		describe "#update" do 

			context 'update product without token ' do 
				it 'Returns unauthorized user' do 
					patch :update,
					params:{id:product.id} 
					expect(response).to have_http_status :unauthorized
				end
			end

			context 'update product with token ' do 
				it 'Returns update successfully' do
					authenticate_user 
					patch :update,
					params:{id:product.id, name:"bhanu"}
					product = JSON.parse(response.body) 
					expect(response).to have_http_status :ok
					# expect(product[:name]).to eq(1)
				end
			end

			context 'update product with  more attribute' do 
				it 'Returns unauthorized user' do
					authenticate_user 
					patch :update,
					params:{id:product.id, name:"bhanu",price:1000} 
					expect(response).to have_http_status :ok
				end
			end

		end

		describe "#delete" do 

			context "delete without token" do 
				it 'return unathorized user' do 
					delete :destroy,
					params:{id:product.id}
					expect(response).to have_http_status :unauthorized
				end
			end

			context "delete with token" do 
				it 'return unathorized user' do
					authenticate_user 
					delete :destroy,
					params:{id:product.id}
					expect(response).to have_http_status :ok
				end
			end

		end

		describe "show" do 

			context "show with token" do 
				it "return product details" do 
					authenticate_user
					get :show, params:{id:product.id}
					expect(response).to have_http_status :ok
				end
			end

		end

end
		



	