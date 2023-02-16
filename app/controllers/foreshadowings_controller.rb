class ForeshadowingsController < ApplicationController
  def index
    @current_page = "tab4"
    @plot = Plot.find(params[:plot_id])
    @foreshadowings = @plot.foreshadowings.order(created_at: :asc)
  end

  def new
    @foreshadowing = Foreshadowing.new
  end
  
  def create
    @plot = Plot.find(params[:plot_id])
    @foreshadowing = Foreshadowing.new(foreshadowing_params)
    if @foreshadowing.save
      redirect_to plot_foreshadowings_path(@plot), success: "作成しました！"
    else
      redirect_to plot_foreshadowings_path(@plot), danger: "作成できませんでした"
    end
  end

  private

  def foreshadowing_params
    params.permit(:name, :body).merge(plot_id: params[:plot_id])
  end
end
