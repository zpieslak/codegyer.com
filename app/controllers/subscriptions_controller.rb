class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @subscription = Subscription.new subscription_params

    if @subscription.save
      SubscriptionMailer.subscribe_email(@subscription).deliver_now
      render status: :created, json: { message: 'Thank you for your subscription' }
    else
      render status: :unprocessable_entity, json: { message: "Error: #{@subscription.errors.full_messages.first}" }
    end
  end

  def unsubscribe
    @subscription = Subscription.find_by token: params[:token]
    @subscription.destroy
  end

  private

  def subscription_params
    params.require(:subscription).permit :email
  end
end
