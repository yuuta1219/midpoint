class PlotsController < ApplicationController

  def index
    @q = Plot.where(user_id: [current_user.id]).ransack(params[:q])
    @plots = @q.result(distinct: true).order(name: "DESC")
    @message = "Hello, world!"
  end

  def new
    @plot = Plot.new
  end

  def show
    @plot = Plot.find(params[:id])
    @eighteen_line = EighteenLine.new
    @eighteen_lines = @plot.eighteen_lines.order(created_at: :asc)
  end

  def create
    @plot = current_user.plots.build(plot_params)
    if @plot.save
      redirect_to new_plot_path, success: "作成しました！"
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
    params.require(:plot).permit(:name, :theme, :one_line, :memo)
  end

end
