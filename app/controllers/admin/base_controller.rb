class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def not_authenticated
    redirect_to root_path
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
