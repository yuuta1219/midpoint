class EighteenLinesController < ApplicationController
  def create
    eighteen_line = EighteenLine.new(eighteen_line_params)
    if eighteen_line.save
      redirect_to plot_path(eighteen_line.plot), success: "作成しました！"
    else
      redirect_to plot_path(eighteen_line.plot), danger: "作成できませんでした"
    end
  end

  private

  def eighteen_line_params
    params.require(:eighteen_line).permit(:body).merge(plot_id: params[:plot_id])
  end
  
end