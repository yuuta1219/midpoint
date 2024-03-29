class OauthsController < ApplicationController
  skip_before_action :require_login, only: [:oauth, :callback]

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, notice: "#{provider.titleize}でログインしました!"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, notice: "#{provider.titleize}でログインしました!"
      rescue
        redirect_to root_path, alert: "#{provider.titleize}でログインできませんでした"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
