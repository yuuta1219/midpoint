class EighteenLinesController < ApplicationController
  before_action :plot_find, only: [:index, :create]
  before_action :eighteen_line_and_plot_find, only: [:update, :destroy]
  before_action :check_plot_owner, only: [:create, :update, :destroy]
  before_action :check_plot_accessibility, only: [:index]
  before_action :chat_ai

  def index
    @current_page = "tab2"
    @eighteen_lines = @plot.eighteen_lines.order(number: :asc)
    @eighteen_line = EighteenLine.new
  end

  def create
    @eighteen_line = @plot.eighteen_lines.build(eighteen_line_params)
    if @eighteen_line.save
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), success: "作成しました！"
    else
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), danger: "作成できませんでした"
    end
  end

  def update
    if @eighteen_line.update(eighteen_line_params.merge(plot_id: @eighteen_line.plot_id))
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), notice: '更新しました'
    else
      redirect_to plot_eighteen_lines_path(@eighteen_line.plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @eighteen_line.destroy!
    redirect_to plot_eighteen_lines_path(@eighteen_line.plot), status: :see_other, success: "削除しました！"
  end

  private

  def eighteen_line_params
    params.require(:eighteen_line).permit(:number, :body, :explanation, :name).merge(plot_id: params[:plot_id])
  end

  def eighteen_line_and_plot_find
    @eighteen_line = EighteenLine.find(params[:id])
    @plot = @eighteen_line.plot
  end
end