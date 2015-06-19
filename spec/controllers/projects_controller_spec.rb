require 'rails_helper'

RSpec.describe ProjectsController do
  subject(:project) { create :project }

  describe 'GET #index' do
    before { get :index }

    it 'renders index view' do
      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'assigns projects and title' do
      expect(assigns(:projects)).to match_array [project]
      expect(assigns(:title)).to eq 'Projects we made'
    end
  end

  describe 'GET #show' do
    before { get :show, id: project }

    it 'renders index view' do
      expect(response).to be_success
      expect(response).to render_template :show
    end

    it 'assigns project and title' do
      expect(assigns(:project)).to eq project
      expect(assigns(:title)).to eq "Projects we made - #{project.name}"
    end
  end
end
