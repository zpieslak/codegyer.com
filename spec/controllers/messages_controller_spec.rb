require 'spec_helper'

describe MessagesController do
  before(:each) { reset_email }

  describe "GET #new" do
    it "renders the :new view" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      subject(:message) { attributes_for :message }

      it "creates a new message" do
        expect{
          post :create, message: message
        }.to change(Message, :count).by(1)
      end

      it "sends an email" do
        post :create, message: message
        last_email.from.should == [message[:email]]
      end

      it "redirects to the success page" do
        post :create, message: message
        response.should redirect_to action: :success
      end
    end

    context "with invalid attributes" do
      subject(:message_invalid) { attributes_for(:message, :invalid) }

      it "does not save the new message" do
        expect{
          post :create, message: message_invalid
        }.to_not change(Message, :count)
      end

      it "re-renders the new method" do
        post :create, message: message_invalid
        response.should render_template :new
      end
    end
  end

  describe "GET #success" do
    it "responds successfully with an HTTP 200 status code" do
      get :success
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :success
      expect(response).to render_template("success")
    end
  end
end
