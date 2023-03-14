class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @color = "normal"
    @notifications = Notification.all
  end

  def show
    @color = "normal"
    @notifications = Notification.all
    @user_id = current_user.id
    @notification_id = @notification.id
    @notification_user = NotificationUser.where(user_id: @user_id, notification_id: @notification_id).first
    unless @notification_user.present?
      @notification_user = NotificationUser.create(user_id: @user_id, notification_id: @notification_id)
    end
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to @notification, notice: "お知らせを作成しました"
    else
      render :new
    end
  end

  def edit
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
    params.require(:notification).permit(:name, :message, :title)
  end
end
