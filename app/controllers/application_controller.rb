class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path
  end

  def set_notifications
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def plot_find
    @plot = Plot.find(params[:plot_id])
  end

  def check_plot_owner
    redirect_to root_path unless @plot.user == current_user
  end
end
