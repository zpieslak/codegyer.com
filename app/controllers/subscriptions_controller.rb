class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        SubscriptionMailer.subscribe_email(@subscription).deliver
        format.html { redirect_to root_path }
        format.json { render json: { message: "Thank you for your subscription" }, status: :created }
      else
        format.html { redirect_to root_path }
        format.json { render json: { message: "Error: #{@subscription.errors.full_messages.first}" }, status: :unprocessable_entity }
      end
    end
  end

  def unsubscribe
    @subscription = Subscription.find_by token: params[:token]
    @subscription.destroy
    respond_to do |format|
      format.html
    end
  end

  private
    def subscription_params
      params.require(:subscription).permit(:email)
    end
end
