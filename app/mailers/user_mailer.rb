class UserMailer < ApplicationMailer
  default from: "maaqib121@gmail.com"

  def welcome_email
    @user = params[:user]
    if Rails.env.development?
      @url = "localhost:3000/login"
    else
      @url = "https://aaqib-alphablog.herokuapp.com/login"
    end
    mail(to: @user.email, subject: "Welcome to Alpha Blog")
  end
end
