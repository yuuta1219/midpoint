class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create new_guest]

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

  def new_guest
    user = User.create_guest
    auto_login(user)
    redirect_to plots_path, success: "ゲストユーザーとしてログインしました。"
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end