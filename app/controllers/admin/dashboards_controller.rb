class Admin::DashboardsController < Admin::BaseController
  def index
    @users = User.all
    @plots = Plot.all
    @notifications = Notification.all
  end
end
