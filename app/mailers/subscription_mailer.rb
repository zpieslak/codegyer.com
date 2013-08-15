class SubscriptionMailer < ActionMailer::Base
  default from: "contact@codegyver.pl"

  def subscribe_email(subscription)
    @subscription = subscription
    mail(to: subscription.email, subject: 'You were successfully subscribed')
  end
end
