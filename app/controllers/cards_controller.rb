class CardsController < ApplicationController
  before_action :plot_find, only: [:index, :create]
  before_action :card_and_plot_find, only: [:edit, :update, :destroy]
  before_action :check_plot_owner
  before_action :foreshadowing_cards, only: [:index, :edit]

  def index
    @current_page = "tab3"
    @card = Card.new
    @cards = @plot.cards.where(scene_type: :explicit).includes(:foreshadowing_cards, :foreshadowings).order(scene: :asc)
    @implicit_cards = @plot.cards.where(scene_type: :implicit).includes(:foreshadowing_cards, :foreshadowings).order(time_start: :asc)
    @timelines = @plot.cards.order(time_start: :asc)

    @cards_json = @cards.to_json(only: [:scene, :emotional_value])
    @cards_json_foreshadowing = @plot.foreshadowings.joins(:card).select('cards.scene, foreshadowings.name, foreshadowing_id').to_json
    
  end
  
  def edit; end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to plot_cards_path(@plot), success: "作成しました！"
    else
      redirect_to plot_cards_path(@plot), danger: "作成できませんでした"
    end
  end

  def update
    if @card.update(card_params.merge(plot_id: @card.plot_id))
      redirect_to plot_cards_path(@card.plot), notice: 'カードを更新しました'
    else
      redirect_to plot_cards_path(@card.plot),success: "更新できませんでした。"
    end
  end

  def destroy
    @card.destroy!
    redirect_to plot_cards_path(@card.plot), status: :see_other, success: "削除しました！"
  end

  private

  def card_params
    params.require(:card).permit(:scene, :time_start, :time_end, :title, :current_location, :scene_type, :point_of_view, :emotional_value, :body, foreshadowing_ids: [],foreshadowing_cards: [:status]).merge(plot_id: params[:plot_id])
  end

  def card_and_plot_find
    @card = Card.find(params[:id])
    @plot = @card.plot
  end

  def foreshadowing_cards
    @foreshadowing_cards = @plot.foreshadowings.all
  end
end
