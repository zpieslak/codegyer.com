class PagesController < ApplicationController
  caches_page :home, :services, :not_found

  def home
    @home = true
  end

  def services
  end

  def not_found
  end
end
