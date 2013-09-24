class ProjectsController < ApplicationController
  caches_page :index, :show

  def index
    @title = "Projects we made"
    @projects = Project.all.order("date_at DESC")
  end

  def show
    @project = Project.find params[:id]
    @title = "Projects we made - #{@project.name}"
  end
end
