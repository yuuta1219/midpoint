class DemosController < ApplicationController
  skip_before_action :require_login
  before_action :find_demo_date
  before_action :foreshadowing_cards, only: [:cards]
  ADMIN_USER_ID = 1

  def plots; end
  def plots_new; end
  def plots_show
  end
  def eighteen_lines
  end
  def foreshadowings
  end
  def characters
  end
  def characters_show
  end

  def cards
    @current_page = "tab3"
    @card = Card.new
    @cards = @plot.cards.where(scene_type: :explicit).includes(:foreshadowing_cards, :foreshadowings).order(scene: :asc)
    @implicit_cards = @plot.cards.where(scene_type: :implicit).includes(:foreshadowing_cards, :foreshadowings).order(time_start: :asc)
    @timelines = @plot.cards.order(time_start: :asc)

    @cards_json = @cards.to_json(only: [:scene, :emotional_value])
    @cards_json_foreshadowing = @plot.foreshadowings.joins(:card).select('cards.scene, foreshadowings.name').to_json
  end

  private

  def find_demo_date
    @plot = Plot.friendly.where(user_id: ADMIN_USER_ID).order(created_at: :asc).first
  end
  def foreshadowing_cards
    @foreshadowing_cards = @plot.foreshadowings.all
  end
end
