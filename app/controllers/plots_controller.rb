class PlotsController < ApplicationController
  include PlotsHelper
  add_flash_types :success, :info, :warning, :danger
  before_action :set_notifications, only: [:index, :new, :create]
  before_action :chat_ai, only: [:index, :show, :new, :create]
  
  def index
    @q = current_user.plots.ransack(params[:q])
    @plots = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def show
    @current_page = "tab1"
    @plot = Plot.friendly.find(params[:id])
    check_plot_accessibility
    @eighteen_line = EighteenLine.new
    @eighteen_lines = @plot.eighteen_lines.order(created_at: :asc)
  end

  def new
    @plot = Plot.new
  end

  def create
    @plot = current_user.plots.build(plot_params)
    if @plot.save
      current_user.running? ? tutorials_create_cards(@plot) : create_cards(@plot)
      redirect_to plot_path(@plot), success: "作成しました！"
    else
      flash.now[:danger] = "作成できませんでした。"
      render :new
    end
  end
  
  def update
    @plot = current_user.plots.friendly.find(params[:id])
    if @plot.update(plot_params)
      redirect_to plot_path(@plot), success: "更新しました！"
    else
      redirect_to plot_path(@plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @plot = current_user.plots.friendly.find(params[:id])
    @plot.destroy!
    redirect_to plots_path, status: :see_other, success: "削除しました！"
  end

  private

  def plot_params
    params.require(:plot).permit(:name, :theme, :one_line, :color, :length_type, :timeline, :person, :accessibility)
  end

end
