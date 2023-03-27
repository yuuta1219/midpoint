class ForeshadowingsController < ApplicationController
  before_action :plot_find, only: [:index, :create]
  before_action :foreshadowing_and_plot_find, only: [:update, :destroy]
  before_action :check_plot_owner

  def index
    @current_page = "tab4"
    @foreshadowings = @plot.foreshadowings.order(created_at: :asc)
    @foreshadowing = Foreshadowing.new
  end
  
  def create
    @foreshadowing = Foreshadowing.new(foreshadowing_params)
    if @foreshadowing.save
      redirect_to plot_foreshadowings_path(@plot), success: "作成しました！"
    else
      redirect_to plot_foreshadowings_path(@plot), danger: "作成できませんでした"
    end
  end

  def update
    if @foreshadowing.update(foreshadowing_params.merge(plot_id: @foreshadowing.plot_id))
      redirect_to plot_foreshadowings_path(@foreshadowing.plot), notice: '更新しました'
    else
      redirect_to plot_foreshadowings_path(@foreshadowing.plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @foreshadowing.destroy!
    redirect_to plot_foreshadowings_path(@foreshadowing.plot), status: :see_other, success: "削除しました！"
  end

  private

  def foreshadowing_params
    params.require(:foreshadowing).permit(:number, :name, :body, :explanation, card_ids: [],foreshadowing_cards: [:status]).merge(plot_id: params[:plot_id])
  end

  def foreshadowing_and_plot_find
    @foreshadowing = Foreshadowing.find(params[:id])
    @plot = @foreshadowing.plot
  end
end
