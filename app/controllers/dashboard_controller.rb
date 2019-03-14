class DashboardController < ApplicationController
  def index
    @follows = Event.where(user: current_user) + Fertilization.where(user: current_user) + Treatment.where(user: current_user)
    add_breadcrumb "Dashboard"  
  end
end
