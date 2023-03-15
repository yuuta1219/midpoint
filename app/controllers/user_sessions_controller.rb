class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @color = "normal"
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def create
    @color = "normal"
    @notifications = Notification.all
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to plots_path, success: "ログインしました。"
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