class ProjectsController < ApplicationController
  caches_page :index, :show

  def index
    @projects = Project.all.order("date_at DESC")
  end

  def show
    @project = Project.find params[:id]
  end
end
