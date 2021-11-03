class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    @user = user
    # mail(to: "#{user.name} <#{user.email}>", subject: 'Registration Confirmation')
    mail(from: 'jarriror@gmail.com', to: 'abraham.asturies@gmail.com', subject: 'test',
         body: 'The lasst one!').deliver
  end
end
