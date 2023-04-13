class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_notifications, only: [:my_page]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to plots_path, success: "アカウントを作成しました🎉"
    else
      flash.now[:danger] = "アカウトを作成できませんでした。"
      render :new
    end
  end

  def my_page
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "アカウントを削除しました。"
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end