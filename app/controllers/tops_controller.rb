class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy_policy treatment]

  def top
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def terms
    @color = "normal"
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def privacy_policy
    @color = "normal"
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def treatment
    @color = "normal"
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

end