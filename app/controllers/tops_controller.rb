class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy_policy treatment]
  before_action :set_notifications, only: [:top, :terms, :privacy_policy, :treatment]

  def top
    @color = "normal"
  end

  def terms; end

  def privacy_policy; end

  def treatment; end

end