class Admin::DashboardsController < Admin::BaseController
  def index
    @users = User.all.order(created_at: :desc)
    @plots = Plot.all.order(created_at: :desc)
    @notifications = Notification.all.order(created_at: :desc)
  end
end
