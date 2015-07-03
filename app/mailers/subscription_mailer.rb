class SubscriptionMailer < ActionMailer::Base
  default from: "CodeGyver <#{ENV.fetch('smtp_settings_user_name')}>"
  default reply_to: 'CodeGyver <contact@codegyver.com>'

  def subscribe_email(subscription)
    @subscription = subscription
    mail(to: subscription.email, subject: 'You were successfully subscribed')
  end
end
