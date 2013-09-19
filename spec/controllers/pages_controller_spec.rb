require 'spec_helper'

describe PagesController do
  describe "GET #home" do
    it "responds successfully with an HTTP 200 status code" do
      get :home
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the home template" do
      get :home
      expect(response).to render_template("home")
    end
  end

  describe "GET #services" do
    it "responds successfully with an HTTP 200 status code" do
      get :services
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the services template" do
      get :services
      expect(response).to render_template("services")
    end
  end

  describe "GET #not_found" do
    it "responds with an HTTP 200 status code" do
      get :not_found
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the not_found template" do
      get :not_found
      expect(response).to render_template("not_found")
    end
  end
end
