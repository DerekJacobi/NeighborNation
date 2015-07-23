class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  # layout 'mailer'

  def send_post_notify_email(user)
    @user = user

    mail(to: @user.email,
    :subject => 'Someone has commented on your post!')
  end

end
