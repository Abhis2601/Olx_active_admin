require 'rails_helper'

	include JsonWebToken

RSpec.describe ProductsController, type: :controller do
let(:user) {FactoryBot.create(:user)}
let(:product) {FactoryBot.create(:product)}
  # @token = jwt_encode(user_id: user.id)
let(:category) {FactoryBot.create(:category)}
# before(:each) do
# 		@user = FactoryBot.create(:user)
# 		@product = FactoryBot.create(:product)
# end
	
	describe '#actions' do 
		
		describe '#create' do

			context 'with token' do 
				context 'with correct params' do

					it 'Returns product created ' do
						# byebug
						# token = jwt_encode(user.id)
						# headers:{token: @token}
						post :create ,
							params:{
								name:"Laptop",
								price:35000,
								 description:"this is newly laptop",
								 category_id:1, 
								 user_id:1
								# product_image:'laptop.jpg'
							}
							byebug
							product = JSON.parse(response.body)
            expect(response).to have_http_status :created
					end
				end

			end

		end 

	end

end


		# describe '#index' do 

		# 	context 'without token' do 
		# 		it 'Returns unauthorized user' do
		# 			get :index
		# 			expect(response).to have_http_response(400)
		# 		end
		# 	end

		# 	context 'with token' do 

		# 		context 'Search with blank in  name params' do				
		# 			it 'Returns all product which is name like params name ' do 
		# 				get :index ,
		# 				params{ name:" "}
		# 				expect(response).to have_http_response(200)
		# 			end
		# 		end

		# 		context 'Search with blank in  category_name params' do				
		# 			it 'Returns all product which is category_name like params category_name' do 
		# 				get :index ,
		# 				params{ category_name:'' }
		# 				expect(response).to have_http_response(200)
		# 			end
		# 		end

		# 		context 'Search with name params' do				
		# 			it 'Returns all product which is belong to params name ' do 
		# 				get :index ,
		# 				params{	name:'Laptop'}
		# 				byebug
		# 				expect(response).to have_http_response(200)
		# 			end
		# 		end

		# 		context 'Search with category params' do				
		# 			it 'Returns all product which is belong to parms category_name ' do 
		# 				get :index ,
		# 				params{ category_name:'Electronics and Appliances'}
		# 				expect(response).to have_http_response(200)
		# 			end
		# 		end

		# 	end
		# end

		# describe '#current_user_products' do 

		# 	context 'without token' do 
		# 		it 'Returns unauthorized user' do
		# 			get :current_user_products
		# 			expect(response).to have_http_response(400)
		# 		end
		# 	end

		# 	context 'with token' do 
			  
		# 		context 'current user has products' do 
		# 	  	it 'Returns all product of current user which status is available' do 
		# 	  		get :current_user_products
		# 	  		expect(response).to have_http_response(200)
		# 	  	end
		# 	  end

		# 	  context 'current user has no products' do 
		# 	  	it 'Returns no product found' do 
		# 	  		get :current_user_products
		# 	  		expect(response).to have_http_response(200)
		# 	  	end
		# 	  end

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
	
