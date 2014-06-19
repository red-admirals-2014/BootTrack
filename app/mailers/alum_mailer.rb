class AlumMailer < ActionMailer::Base
  default from: "BootsTrack@gmail.com"

  def contact_attempt(grad, name, email, message)
    @name = name
    @message = message
    @grad = grad
    @email = email
    mail to: grad.email, subject: "Someone wants to contact you about DBC!"
  end
end
