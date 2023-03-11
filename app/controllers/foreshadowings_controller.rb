class ForeshadowingsController < ApplicationController
  def index
    @current_page = "tab4"
    @plot = Plot.find(params[:plot_id])
    @foreshadowings = @plot.foreshadowings.order(created_at: :asc)
    @foreshadowing = Foreshadowing.new

    redirect_to root_path unless @plot.user == current_user
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

  def update
    @foreshadowing = Foreshadowing.find(params[:id])
    if @foreshadowing.update(foreshadowing_params.merge(plot_id: @foreshadowing.plot_id))
      redirect_to plot_foreshadowings_path(@foreshadowing.plot), notice: '更新しました'
    else
      redirect_to plot_foreshadowings_path(@foreshadowing.plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @foreshadowing = Foreshadowing.find(params[:id])
    @foreshadowing.destroy!
    redirect_to plot_foreshadowings_path(@foreshadowing.plot), status: :see_other, success: "削除しました！"
  end

  private

  def foreshadowing_params
    params.require(:foreshadowing).permit(:number, :name, :body, :explanation, card_ids: [],foreshadowing_cards: [:status]).merge(plot_id: params[:plot_id])
  end
end
