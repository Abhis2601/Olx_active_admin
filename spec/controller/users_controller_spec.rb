require 'rails_helper'
# require 'Factories/user.rb'
	include JsonWebToken

RSpec.describe UsersController, type: :controller do
	let(:user){ FactoryBot.create(:user)}
	before(:each) do 
		@token = jwt_encode(user_id:user.id)
	end
	let(:authenticate_user) do 
		request.headers['Authorization'] = "Bearer #{@token}"
	end

	describe "#action" do 

		describe "#create" do

			context " create user with incorrect params " do 
				it "return unprocessable entity" do
					post :create , params:{				
						first_name:"abhi" ,
						last_name: "singh",
						password: "12346",
						mobile_no: 9876543210
					}
					# user = JSON.parse(response.body)
					expect(response).to have_http_status :unprocessable_entity
				end
			end
		
			context " create user " do 
				it "return user created successfully" do
					post :create , params:{				
						first_name:"abhi" ,
						last_name: "singh",
						email: "abhi@gmail.com",
						password: "12346",
						mobile_no: 9876543210
					}
					# user = JSON.parse(response.body)
					expect(response).to have_http_status :created
				end
			end
		end

		describe "#update" do 
			context "without token" do 
			  it "return unathorized" do 
			  	put :update 
			  	expect(response).to have_http_status :unauthorized
			  end
			end

			context "with token" do 
				it "return user update successfully" do 
					authenticate_user
					put :update, params:{
						first_name: "raja"
					}
					expect(response).to have_http_status :ok
				end
			end
		end

		# describe "#delete" 
	end
end
