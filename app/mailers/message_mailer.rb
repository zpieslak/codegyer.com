class MessageMailer < ActionMailer::Base
  default from: "CodeGyver <#{ENV.fetch('smtp_settings_user_name')}>"
  default to: 'CodeGyver <contact@codegyver.com>'

  def new_message_email(message)
    @message = message
    mail(reply_to: "#{message.name} <#{message.email}>", subject: 'Mail from contact form')
  end
end
