require 'rails_helper'

RSpec.describe PagesController do
  describe 'GET #home' do
    before { get :home }

    it 'renders template' do
      expect(response).to be_success
      expect(response).to render_template :home
    end

    it 'assigns variables' do
      expect(assigns(:home)).to be_truthy
    end
  end

  describe 'GET #services' do
    before { get :services }

    it 'renders template' do
      expect(response).to be_success
      expect(response).to render_template :services
    end

    it 'assigns variables' do
      expect(assigns(:title)).to eq 'Your choice for Ruby on Rails (RoR) development & consulting'
    end
  end
end
