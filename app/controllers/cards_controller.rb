class CardsController < ApplicationController
  def index
    @current_page = "tab2"
    @plot = Plot.find(params[:plot_id])
    @cards = @plot.cards.order(scene: :asc)
    @cards_json = @cards.to_json(only: [:scene, :emotional_value])
    @card = Card.new
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
      redirect_to root_path, success: "更新できませんでした。"
    end
  end


  private

  def card_params
    params.require(:card).permit(:scene, :time, :current_location, :point_of_view, :emotional_value, :body, :status, foreshadowing_ids: []).merge(plot_id: params[:plot_id])
  end
end
