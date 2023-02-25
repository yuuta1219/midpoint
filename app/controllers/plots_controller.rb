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
      40.times do |n|
        @plot.cards.create(name: "シーン#{n+1}")
      end
      18.times do |n|
        @plot.eighteen_lines.create(body: "プロットポイント#{n+1}を入力してください。")
      end
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
    params.require(:plot).permit(:name, :theme, :one_line, :memo, :color)
  end

end
