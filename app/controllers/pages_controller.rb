class PagesController < ApplicationController
  caches_page :home, :services, :not_found

  def home
    @home = true
  end

  def services
    @title = "Your choice for Ruby on Rails (RoR) development & consulting"
  end

  def not_found
    @title = "The page does not exist"
    render status: status_code
  end

  protected
    def status_code
      params[:code] || 500
    end
end
