class TimelinesController < ApplicationController

  def index
    @current_page = "tab3"
    @plot = Plot.find(params[:plot_id])
    @cards = @plot.cards.includes(:foreshadowing_cards, :foreshadowings).order(scene: :asc)
    @behind_the_scenes =@plot.behind_the_scenes.order(scene: :asc)
  end
end
