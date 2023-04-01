class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  require "openai"

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

  def open_ai
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end
end
