class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[edit update show destroy]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_root_path, success: "変更しました。"
    else
      flash.now[:danger] = "アカウトを作成できませんでした。"
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: "削除しました。"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role)
  end
end
