require 'spec_helper'

describe SubscriptionsController do
  before(:each) { reset_email }

  describe "POST create" do
    context "with valid attributes" do
      subject(:subscription) { attributes_for :subscription }

      it "creates a new subscription" do
        expect{
          post :create, subscription: subscription
        }.to change(Subscription, :count).by(1)
      end

      it "sends an email" do
        post :create, subscription: subscription
        last_email.to.should == [subscription[:email]]
      end
    end

    context "with invalid attributes" do
      subject(:subscription_invalid) { attributes_for :subscription, :invalid }

      it "does not save the new subscription" do
        expect{
          post :create, subscription: subscription_invalid
        }.to_not change(Subscription, :count)
      end
    end

    context "if already subscribed" do
      subject(:subscription) { attributes_for :subscription }

      it "does not save the new subscription" do
        Subscription.create subscription
        expect {
          post :create, subscription: subscription
        }.to_not change(Subscription, :count)
      end
    end
  end

  describe "GET unsubscribe" do
    context "with valid token" do
      it "unsubscribe user" do
        subscription = create :subscription
        expect {
          get :unsubscribe, token: subscription.token
        }.to change(Subscription, :count).by(-1)
      end
    end

    context "with invalid token" do
      it "does not unsubscribe user" do
        expect {
          get :unsubscribe, token: "123456789"
        }.to raise_error( NoMethodError )
      end
    end
  end
end
