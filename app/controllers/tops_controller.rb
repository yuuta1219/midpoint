class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy_policy treatment]

  def top
    @color = "normal"
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def terms
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def privacy_policy
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def treatment
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

end