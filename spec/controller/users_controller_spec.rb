require 'rails_helper'
# require 'Factories/user.rb'
	include JsonWebToken

RSpec.describe UsersController, type: :controller do
	let(:user){ FactoryBot.create(:user)}
	# before(:each) do
	# 	@user = FactoryBot.create(:user)
	# end
	describe "#action" do 

		describe "#create" do

			context " create user " do 
				it "return user created successfully" do
					# token = JsonWebToken.encode(user.id)
					# headers:{token: token},
					post :create , params:{
						# first_name: @user.first_name,
						# last_name: @user.last_name,
						# email: @user.email,
						# password: @user.password,
						# mobile_no: @user.mobile_no
						first_name:"abhi" ,
						last_name: "singh",
						email: "abhi@gmail.com",
						password: "12346",
						mobile_no: 9876543210
					}
					user = JSON.parse(response.body)
					expect(response).to have_http_status :created
				end
			end

		end
	end
end
