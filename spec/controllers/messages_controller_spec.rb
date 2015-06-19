require 'spec_helper'

RSpec.describe MessagesController do
  before { reset_email }

  describe 'GET #new' do
    before { get :new }

    it 'renders the :new view' do
      expect(response).to be_success
      expect(response).to render_template :new
    end

    it 'assigns variables' do
      expect(assigns(:message)).to be_an_instance_of Message
      expect(assigns(:title)).to eq 'Contact our Ruby on Rails team'
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      subject(:message) { attributes_for :message }

      it 'assigns variables' do
        post :create, message: message
        expect(assigns(:message)).to be_an_instance_of Message
        expect(assigns(:title)).to eq 'Contact our Ruby on Rails team'
      end

      it 'creates a new message' do
        expect{ post :create, message: message }.to change(Message, :count).by(1)
      end

      it 'sends an email' do
        post :create, message: message
        expect(last_email.from).to eq [message.fetch(:email)]
        expect(last_email.subject).to eq 'Mail from contact form'
      end

      it 'redirects to the success page' do
        post :create, message: message
        expect(response).to redirect_to(action: :success)
      end
    end

    context 'with invalid attributes' do
      subject(:message_invalid) { attributes_for(:message, :invalid) }

      it 'does not save the new message' do
        expect{ post :create, message: message_invalid }.to_not change(Message, :count)
      end

      it 're-renders the new method' do
        post :create, message: message_invalid
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #success' do
    it 'renders template' do
      get :success
      expect(response).to be_success
      expect(response).to render_template :success
    end
  end
end
