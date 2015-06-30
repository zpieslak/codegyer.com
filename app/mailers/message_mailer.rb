class MessageMailer < ActionMailer::Base
  default to: 'contact@codegyver.com'

  def new_message_email(message)
    @message = message
    mail(from: message.email, subject: 'Mail from contact form')
  end
end
