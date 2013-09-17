require 'spec_helper'

describe ProjectsController do
  describe "GET #index" do
    it "populates an array of projects" do
      project = create :project
      get :index
      assigns(:projects).should eq([project])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    subject(:project) { create :project }

    it "assigns the requested project to @project" do
      get :show, id: project
      assigns(:project).should eq(project)
    end

    it "renders the #show view" do
      get :show, id: project
      response.should render_template :show
    end
  end
end
