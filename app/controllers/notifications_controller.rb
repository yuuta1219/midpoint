class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_notifications, only: [:index]

  def index; end

  def show
    @notifications = Notification.all.order(created_at: :desc)
    @notification_user = NotificationUser.find_or_create_by(user_id: current_user.id, notification_id: @notification.id)
    @read_confirmation = @notifications.size == NotificationUser.where(user_id: current_user.id).count if logged_in?
  end

  def new
    @notification = Notification.new
  end

  def edit; end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to @notification, notice: "お知らせを作成しました"
    else
      render :new
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to @notification, notice: "お知らせを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_url, notice: "お知らせを削除しました"
  end

  
  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end

  def notification_params
    params.require(:notification).permit(:name, :body, :title)
  end
end
