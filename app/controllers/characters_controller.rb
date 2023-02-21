class CharactersController < ApplicationController
  def index
    @current_page = "tab4"
    @plot = Plot.find(params[:plot_id])
    @characters = @plot.characters.order(created_at: :asc)
  end

  def new
    @character = Character.new
  end
  
  def create
    @plot = Plot.find(params[:plot_id])
    @character = Character.new(character_params)
    if @character.save
      redirect_to plot_characters_path(@plot), success: "作成しました！"
    else
      redirect_to plot_characters_path(@plot), danger: "作成できませんでした"
    end
  end

  private

  def character_params
    params.permit(:name, :body).merge(plot_id: params[:plot_id])
  end
end