class PlotsController < ApplicationController

  def index
    @q = current_user.plots.ransack(params[:q])
    @plots = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @plot = Plot.new
  end

  def show
    @current_page = "tab1"
    @plot = Plot.find(params[:id])
    @eighteen_line = EighteenLine.new
    @eighteen_lines = @plot.eighteen_lines.order(created_at: :asc)
  end

  def create
    @plot = current_user.plots.build(plot_params)
    if @plot.save
      redirect_to plot_path(@plot), success: "作成しました！"
    else
      flash.now[:danger] = "作成できませんでした。"
      render :new
    end
  end

  def edit
    @plot = current_user.plots.find(params[:id])
  end
  
  def update
    @plot = current_user.plots.find(params[:id])
    if @plot.update(plot_params)
      redirect_to plots_path, success: "更新しました！"
    else
      flash.now[:danger] = "更新できませんでした。"
      render :edit
    end
  end

  def destroy
    @plot = current_user.plots.find(params[:id])
    @plot.destroy!
    redirect_to plots_path, status: :see_other, success: "削除しました！"
  end

  private

  def plot_params
    params.require(:plot).permit(:name, :theme, :one_line, :memo, :color)
  end

end
