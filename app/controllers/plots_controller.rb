class PlotsController < ApplicationController
  include PlotsHelper
  add_flash_types :success, :info, :warning, :danger
  
  def index
    @color = "normal"
    @q = current_user.plots.ransack(params[:q])
    @plots = @q.result(distinct: true).includes(:user).order(created_at: :desc)
    @notifications = @plots
  end

  def show
    @current_page = "tab1"
    @plot = Plot.find(params[:id])
    @eighteen_line = EighteenLine.new
    @eighteen_lines = @plot.eighteen_lines.order(created_at: :asc)
    redirect_to root_path unless @plot.user == current_user
  end

  def new
    @color = "normal"
    @plot = Plot.new
  end

  def create
    @color = "normal"
    @plot = current_user.plots.build(plot_params)
    if @plot.save
      create_cards(@plot)
      redirect_to plot_path(@plot), success: "作成しました！"
    else
      flash.now[:danger] = "作成できませんでした。"
      render :new
    end
  end
  
  def update
    @plot = current_user.plots.find(params[:id])
    if @plot.update(plot_params)
      redirect_to plot_path(@plot), success: "更新しました！"
    else
      redirect_to plot_path(@plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @plot = current_user.plots.find(params[:id])
    @plot.destroy!
    redirect_to plots_path, status: :see_other, success: "削除しました！"
  end

  private

  def plot_params
    params.require(:plot).permit(:name, :theme, :one_line, :color, :length, :time, :person)
  end

end
