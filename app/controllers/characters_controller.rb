class CharactersController < ApplicationController
  def index
    @current_page = "tab5"
    @plot = Plot.find(params[:plot_id])
    @characters = @plot.characters.order(created_at: :asc)
    @character = Character.new
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

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params.merge(plot_id: @character.plot_id))
      redirect_to plot_characters_path(@character.plot), notice: '更新しました'
    else
      redirect_to plot_characters_path(@character.plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy!
    redirect_to plot_characters_path(@character.plot), status: :see_other, success: "削除しました！"
  end

  private

  def character_params
    params.require(:character).permit(:name, :body).merge(plot_id: params[:plot_id])
  end
end