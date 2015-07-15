class SubscriptionMailer < ActionMailer::Base
  default from: "CodeGyver <#{ENV.fetch('SMTP_SETTINGS_USER_NAME')}>"
  default reply_to: 'CodeGyver <contact@codegyver.com>'

  def subscribe_email(subscription)
    @subscription = subscription
    mail(to: subscription.email, subject: 'You were successfully subscribed')
  end
end
