class EighteenLinesController < ApplicationController
  before_action :plot_find, only: [:index, :create]

  def index
    @current_page = "tab2"
    @eighteen_lines = @plot.eighteen_lines.order(number: :asc)
    @eighteen_line = EighteenLine.new

    redirect_to root_path unless @plot.user == current_user
  end

  def new
    @eighteen_line = EighteenLine.new
  end

  def create
    @eighteen_line = EighteenLine.new(eighteen_line_params)
    if eighteen_line.save
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), success: "作成しました！"
    else
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), danger: "作成できませんでした"
    end
  end

  def update
    @eighteen_line = EighteenLine.find(params[:id])
    if @eighteen_line.update(eighteen_line_params.merge(plot_id: @eighteen_line.plot_id))
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), notice: '更新しました'
    else
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @eighteen_line = EighteenLine.find(params[:id])
    @eighteen_line.destroy!
    redirect_to plot_eighteen_lines_path(@eighteen_line.plot), status: :see_other, success: "削除しました！"
  end

  private

  def eighteen_line_params
    params.require(:eighteen_line).permit(:number, :body, :explanation, :name).merge(plot_id: params[:plot_id])
  end
  
end