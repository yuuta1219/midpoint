class CardsController < ApplicationController
  def index
    @current_page = "tab2"
    @plot = Plot.find(params[:plot_id])
    @card = Card.new
    @cards = @plot.cards.where(scene_type: :explicit).includes(:foreshadowing_cards, :foreshadowings).order(scene: :asc)
    @implicit_cards = @plot.cards.where(scene_type: :implicit).includes(:foreshadowing_cards, :foreshadowings).order(time_start: :asc)
    @timelines = @plot.cards.order(time_start: :asc)
    @foreshadowing_cards = @plot.foreshadowings.all

    @cards_json = @cards.to_json(only: [:scene, :emotional_value])
    @cards_json_foreshadowing = @plot.foreshadowings.joins(:card).select('cards.scene, foreshadowings.name, foreshadowing_id').to_json
    
    redirect_to root_path unless @plot.user == current_user
  end
  
  def edit
    @card = Card.find(params[:id])
    @plot = @card.plot
    @foreshadowing_cards = @plot.foreshadowings.all
    redirect_to root_path unless @plot.user == current_user
  end

  def create
    @plot = Plot.find(params[:plot_id])
    @card = Card.new(card_params)
    redirect_to root_path unless @plot.user == current_user
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
    if @card.plot.user == current_user
      @card.destroy!
      redirect_to plot_cards_path(@card.plot), status: :see_other, success: "削除しました！"
    else # カードを作成したユーザーでない場合
      redirect_to root_path
    end
  end

  private

  def card_params
    params.require(:card).permit(:scene, :time_start, :time_end, :title, :current_location, :scene_type, :point_of_view, :emotional_value, :body, foreshadowing_ids: [],foreshadowing_cards: [:status]).merge(plot_id: params[:plot_id])
  end
end
