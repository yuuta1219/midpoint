class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy_policy treatment]

  def top; end

  def terms; end

  def privacy_policy; end

  def treatment; end

  def my_page
    @user
  end
end