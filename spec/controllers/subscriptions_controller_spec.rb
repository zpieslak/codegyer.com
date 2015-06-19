require 'rails_helper'

describe SubscriptionsController do
  before { reset_email }

  describe 'POST #create' do
    context 'with valid attributes' do
      subject(:subscription) { attributes_for :subscription }

      it 'creates a new subscription' do
        expect{ post :create, subscription: subscription }.to change(Subscription, :count).by 1
      end

      it 'sends an email' do
        post :create, subscription: subscription
        expect(last_email.to).to eq [subscription.fetch(:email)]
      end
    end

    context 'with invalid attributes' do
      subject(:subscription_invalid) { attributes_for :subscription, :invalid }

      it 'does not save the new subscription' do
        expect{ post :create, subscription: subscription_invalid }.to_not change(Subscription, :count)
      end
    end

    context 'if already subscribed' do
      subject(:subscription) { attributes_for :subscription }
      before { Subscription.create subscription }

      it 'does not save the new subscription' do
        expect { post :create, subscription: subscription }.to_not change(Subscription, :count)
      end
    end
  end

  describe 'GET #unsubscribe' do
    context 'with valid token' do
      subject!(:subscription) { create :subscription }

      it 'unsubscribe user' do
        expect { get :unsubscribe, token: subscription.token }.to change(Subscription, :count).by -1
      end
    end

    context 'with invalid token' do
      it 'does not unsubscribe user' do
        expect { get :unsubscribe, token: 'not-existent' }.to raise_error NoMethodError
      end
    end
  end
end
