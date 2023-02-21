class CardsController < ApplicationController
  def index
    @current_page = "tab2"
    @plot = Plot.find(params[:plot_id])
    @cards = @plot.cards.order(created_at: :asc)
    @cards_json = @cards.to_json(only: [:name, :emotional_value])
  end

  def new
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

  private

  def card_params
    params.permit(:name, :time, :current_location, :point_of_view, :emotional_value, :body).merge(plot_id: params[:plot_id])
  end
end
