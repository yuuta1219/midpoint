class ForeshadowingsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  before_action :plot_find, only: [:index, :create]
  before_action :foreshadowing_and_plot_find, only: [:update, :destroy]
  before_action :check_plot_accessibility, only: [:index]
  before_action :chat_ai

  def index
    @current_page = "tab4"
    @foreshadowings = @plot.foreshadowings.order(created_at: :asc)
    @foreshadowing = Foreshadowing.new
  end
  
  def create
    @foreshadowing = @plot.foreshadowings.build(foreshadowing_params)
    if @foreshadowing.save
      redirect_to plot_foreshadowings_path(@plot), success: "作成しました！"
    else
      redirect_to plot_foreshadowings_path(@plot), danger: "作成できませんでした"
    end
  end

  def update
    @plot = current_user.plots.find(@foreshadowing.plot_id)
    if @foreshadowing.update(foreshadowing_params.merge(plot_id: @foreshadowing.plot_id))
      redirect_to plot_foreshadowings_path(@foreshadowing.plot), notice: '更新しました'
    else
      redirect_to plot_foreshadowings_path(@foreshadowing.plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @plot = current_user.plots.find(@foreshadowing.plot_id)
    @foreshadowing.destroy!
    redirect_to plot_foreshadowings_path(@foreshadowing.plot), status: :see_other, success: "削除しました！"
  end

  private

  def foreshadowing_params
    params.require(:foreshadowing).permit(:name, :body, card_ids: [],foreshadowing_cards: [:status]).merge(plot_id: params[:plot_id])
  end

  def foreshadowing_and_plot_find
    @foreshadowing = Foreshadowing.find(params[:id])
    @plot = @foreshadowing.plot
  end
end
