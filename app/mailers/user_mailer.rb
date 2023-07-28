class UserMailer < ApplicationMailer
  def welcome_email
    email = params[:email]
    # @url  = 'http://example.com/login'
    mail(to: email, subject: 'Welcome to My Awesome Site', content_type: "text/html",
      body: "HI I am Abhishek")
  end
end
