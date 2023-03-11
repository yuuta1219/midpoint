class Admin::DashboardsController < Admin::BaseController
  def index
    @users = User.all
    @plots = Plot.all
  end
end
