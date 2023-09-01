FactoryBot.define do
  factory :user do  
    first_name { 'John' }
    last_name  { 'Doe' }
    email { "john@gmail.com" }
    mobile_no { 7860945310 }
    password {"12346"}
  end
end

