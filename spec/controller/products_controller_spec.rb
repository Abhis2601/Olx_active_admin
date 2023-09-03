require 'rails_helper'

	include JsonWebToken

RSpec.describe ProductsController, type: :controller do
	let(:user) {FactoryBot.create(:user)}
	let(:product) {FactoryBot.create(:product)}
	let(:category) {FactoryBot.create(:category)}
	 
	before(:each) do
		@token = jwt_encode(user_id:user.id)
	end
	let(:authenticate_user) do
		request.headers['Authorization'] = "Bearer #{@token}"
	end

	describe '#actions' do 
		
		describe '#create' do

			context 'without token' do
				it 'Returns unauthorized user ' do 
					post :create 
            expect(response).to have_http_status :unauthorized

				end
			end

			context 'with token' do 
				
				context 'with incorrect params' do

					it 'Returns unprocessable_entity ' do
						authenticate_user
						post :create ,
							params:{
								name:"Laptop",
								 description:"this is newly laptop",
								 category_id:category.id, 
								 user_id:user.id
							}
            expect(response).to have_http_status :unprocessable_entity
					end
				end

				context 'with correct params' do

					it 'Returns product created ' do
						authenticate_user
						post :create ,# headers:{ 'Authorization' => "Bearer #{@token}" },
							params:{
								name:"Laptop",
								price:35000,
								 description:"this is newly laptop",
								 category_id:category.id, 
								 user_id:user.id
							}
							product = JSON.parse(response.body)
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
						params:{name:"laptop"}
						expect(response).to have_http_status :ok
					end
				end

				context 'with category_name params' do				
					it 'Returns all product which is category like params category_name ' do 
						authenticate_user
						get :index,
						params:{category_name:"Electronics"}
						expect(response).to have_http_status :ok
					end
				end

			end
		end


		describe '#current_user_products' do 

			context 'without token' do 
				it 'Returns unauthorized user' do
					get :current_user_products
					expect(response).to have_http_status :unauthorized
				end
			end

			context 'with token' do 
			  
			  context 'current user has no products' do 
			  	it 'Returns no product found' do 
			  		authenticate_user
			  		get :current_user_products
			  		expect(response).to have_http_status :ok
			  	end
			  end

				context 'current user has products' do 
			  	it 'Returns all product of current user which status is available' do 
			  		authenticate_user
			  		get :current_user_products
			  		expect(response).to have_http_status :ok
			  	end
			  end

			end

		end
	end
end
		



		# 	end

		# end


		# describe 'current_user_sold_products'

		# 	context 'without token' do 
		# 		it 'Returns unauthorized user' do
		# 			get :current_user_sold_products
		# 			except(response).to have_http_response(400)
		# 		end
		# 	end

		# 	context 'with token' do 

		# 		context 'current user has product '
		# 			it 'Returns all product of user which status is sold' do
		# 				get :current_user_sold_products
		# 				except(response).to have_http_response(200)
		# 			end
		# 		end

		# 		context 'current user has no product '
		# 			it 'Returns no product found' do
		# 				get :current_user_sold_products
		# 				except(response).to have_http_response(404)
		# 			end
		# 		end
		# 	end

		# end
	
