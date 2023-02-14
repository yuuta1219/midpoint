class CardsController < ApplicationController
  def index
    @plot = Plot.find(params[:plot_id])
    @cards = @plot.cards.order(created_at: :asc)
  end

  def new
    @card = Card.new
  end
  
  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to plot_path(@card.plot), success: "作成しました！"
    else
      redirect_to plot_path(@card.plot), danger: "作成できませんでした"
    end
  end

  private

  def card_params
    params.permit(:name).merge(plot_id: params[:plot_id])
  end
end
