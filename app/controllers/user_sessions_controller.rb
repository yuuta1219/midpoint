class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_notifications, only: [:new, :create]

  def new
    @user = User.new
   end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to plots_path, success: "ログインしました。"
    else
      flash.now[:danger] = "ログインできませんでした。"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_path, status: :see_other, success: "ログアウトしました。"
  end
end