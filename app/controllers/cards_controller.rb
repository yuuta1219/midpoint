class CardsController < ApplicationController
  def index
    @current_page = "tab2"
    @plot = Plot.find(params[:plot_id])
    @card = Card.new
    @cards = @plot.cards.includes(:foreshadowing_cards, :foreshadowings).order(scene: :asc)
    @foreshadowing_cards = @plot.foreshadowings.all

    @cards_json = @cards.to_json(only: [:scene, :emotional_value])
    @cards_json_foreshadowing = @plot.foreshadowings.joins(:card).select('cards.scene, foreshadowings.name,foreshadowing_id').to_json
  end
  
  def create
    @plot = Plot.find(params[:plot_id])
    @card = Card.new(card_params)
    if @card.save
      redirect_to plot_cards_path(@plot), success: "作成しました！"
    else
      redirect_to plot_cards_path(@plot), danger: "作成できませんでした"
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params.merge(plot_id: @card.plot_id))
      redirect_to plot_cards_path(@card.plot), notice: 'カードを更新しました'
    else
      redirect_to plot_cards_path(@card.plot),success: "更新できませんでした。"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy!
    redirect_to plot_cards_path(@card.plot), status: :see_other, success: "削除しました！"
  end

  private

  def card_params
    params.require(:card).permit(:scene, :time, :current_location, :point_of_view, :emotional_value, :body, foreshadowing_ids: [],foreshadowing_cards: [:status]).merge(plot_id: params[:plot_id])
  end
end
