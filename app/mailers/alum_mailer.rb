class AlumMailer < ActionMailer::Base
  default from: "BootTrack@gmail.com"

  def contact_attempt(grad)
    mail to: grad.email
  end
end
