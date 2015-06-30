class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @subscription = Subscription.new subscription_params

    respond_to do |format|
      if @subscription.save
        SubscriptionMailer.subscribe_email(@subscription).deliver_now
        format.json { render status: :created, json: { message: 'Thank you for your subscription' } }
      else
        format.json { render status: :unprocessable_entity, json: { message: "Error: #{@subscription.errors.full_messages.first}" } }
      end

      format.html { redirect_to root_path }
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
