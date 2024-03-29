class CharactersController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :plot_find, only: [:index, :create]
  before_action :character_and_plot_find, only: [:show, :edit, :update, :destroy]
  before_action :check_plot_owner, only: [:edit]
  before_action :check_plot_accessibility, only: [:index, :show]
  before_action :chat_ai

  def index
    @current_page = "tab5"
    @characters = @plot.characters.order(created_at: :asc)
    @character = Character.new
  end

  def show
    @characters = @plot.characters.order(created_at: :asc)
  end

  def edit; end
  
  def create
    @character = @plot.characters.build(character_params)
    if @character.save
      redirect_to plot_characters_path(@plot), success: "作成しました！"
    else
      redirect_to plot_characters_path(@plot), danger: "作成できませんでした"
    end
  end

  def update
    @plot = current_user.plots.find(@character.plot_id)
    if @character.update(character_params.merge(plot_id: @character.plot_id))
      redirect_to plot_characters_path(@character.plot), notice: '更新しました'
    else
      redirect_to plot_characters_path(@character.plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @plot = current_user.plots.find(@character.plot_id)
    @character.destroy!
    redirect_to plot_characters_path(@character.plot), status: :see_other, success: "削除しました！"
  end

  private

  def character_params
    params.require(:character).permit(:name, :body, :age, :appearance, :occupation, :personality, :motivation, :relationship, :role, :avatar).merge(plot_id: params[:plot_id])
  end

  def character_and_plot_find
    @character = Character.find(params[:id])
    @plot = @character.plot
  end
end