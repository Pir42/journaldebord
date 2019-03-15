class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @follows = Event.where(user: current_user).limit(3) + Fertilization.where(user: current_user).limit(3) + Treatment.where(user: current_user).limit(3)
    add_breadcrumb "Dashboard"
  end
end
