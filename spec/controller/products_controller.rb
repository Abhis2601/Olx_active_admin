require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	describe '#actions' do 

		describe '#new' do

			context 'without token' do 
				it 'Returns unauthorized user' do
					get :new
					except(response).to have_http_response(400)
				end
			end

			context 'with token' do 
				it 'Returns sucess' do
					get :new
					except(response).to have_http_response(200)
				end
			end

		end		

		describe '#create' do

			context 'without token' do 
				it 'Returns unauthorized user' do
					get :new
					except(response).to have_http_response(401)
				end
			end

			context 'with token' do 

				context 'with incorrect params' do 
					it 'Returns Bad Request' do 
						post :create ,
						params{
							name: 'Laptop',
							price: ,
							category_id: category.id,
							product_image: 'laptop.jpg'
						}
						except(response).to have_http_response(400)
					end
				end

				context 'with correct params' do
					it 'Returns product created ' do
					post :create ,
						params{
							name: 'Laptop',
							price: 38000,
							category_id: category.id,
							product_image: 'laptop.jpg'
						}
						except(response).to have_http_response(201)
					end
				end
			end
		end


		describe '#index' do 

			context 'without token' do 
				it 'Returns unauthorized user' do
					get :new
					except(response).to have_http_response(400)
				end
			end

			context 'with token' do 

				context 'Search with blank in  name params and name category_name' do				
					it 'Returns all product which status is available ' do 
						get :index ,
						params{
							name: ''
						},
						params{
							category_name: ''
						}
						except(response).to have_http_response(200)
					end
				end

				context 'Search with name params' do				
					it 'Returns all product which is belong to params name ' do 
						get :index ,
						params{
							name: 'Laptop'
						}
						except(response).to have_http_response(200)
					end
				end

				context 'Search with category params' do				
					it 'Returns all product which is belong to parms category_name ' do 
						get :index ,
						params{
							category_name: 'Electronics and Appliances'
						}
						except(response).to have_http_response(200)
					end
				end

			end
		end

		describe '#current_user_products' do 

			context 'without token' do 
				it 'Returns unauthorized user' do
					get :new
					except(response).to have_http_response(400)
				end
			end

			context 'with token' do 
			  context 'current user products' do 
			  	it 'Returns all product of current user which status available' do 
			  		get :current_user_products
			  		except(response).to have_http_response(200)
			  	end
			  end
			end




			end



		end



















	end

end
