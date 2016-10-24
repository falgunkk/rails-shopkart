class UserMailer < ApplicationMailer
  default from: 'falgun@qburst.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/'
    #attachments.inline['3.jpg'] = File.read('/home/qburst/shoppingcart/app/assets/images/3.jpg')
    mail(to: @user.email, subject: 'Welcome to My Rails app')
  end

end

