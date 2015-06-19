class ProjectsController < ApplicationController
  caches_page :index, :show

  def index
    @title = 'Projects we made'
    @projects = Project.order(date_at: :desc)
  end

  def show
    @project = Project.find params[:id]
    @title = "Projects we made - #{@project.name}"
  end
end
