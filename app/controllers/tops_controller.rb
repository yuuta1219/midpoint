class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy_policy treatment]

  def top
    @notifications = Notification.all
  end

  def terms
    @color = "normal"
    @notifications = Notification.all
  end

  def privacy_policy
    @color = "normal"
    @notifications = Notification.all
  end

  def treatment
    @color = "normal"
    @notifications = Notification.all
  end

end