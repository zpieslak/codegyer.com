class SubscriptionMailer < ActionMailer::Base
  default from: 'CodeGyver Team <contact@codegyver.com>'

  def subscribe_email(subscription)
    @subscription = subscription
    mail(to: subscription.email, subject: 'You were successfully subscribed')
  end
end
