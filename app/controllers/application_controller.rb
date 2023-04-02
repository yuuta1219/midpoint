class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  require "openai"

  private

  def not_authenticated
    redirect_to login_path
  end

  def set_notifications
    @notifications = Notification.all.order(created_at: :desc)
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def plot_find
    @plot = Plot.find(params[:plot_id])
  end

  def check_plot_owner
    redirect_to root_path unless @plot.user == current_user
  end

  def chat_ai
    @chat_logs = current_user.chat_logs.order(created_at: :asc)
    current_user.chat_logs.first.destroy if current_user.chat_logs.count > 10
  end
end
