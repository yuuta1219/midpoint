class PlotsController < ApplicationController

  def index
    @q = current_user.plots.ransack(params[:q])
    @plots = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def show
    @current_page = "tab1"
    @plot = Plot.find(params[:id])
    @eighteen_line = EighteenLine.new
    @eighteen_lines = @plot.eighteen_lines.order(created_at: :asc)
  end

  def new
    @plot = Plot.new
  end

  def create
    @plot = current_user.plots.build(plot_params)
    if @plot.save
      40.times do |n|
        @plot.cards.create(scene: n+1 )
      end
      names = ["オープニング","セットアップ","きっかけ","悩みの時","第一ターニングポイント","サブプロット開始","お楽しみ","ミッドポイント","迫り来る悪い奴ら","全てを失って","心の暗闇","第二ターニングポイント","フィナーレ","エンディング"]
      names.each_with_index do |name, index|
        @plot.eighteen_lines.create(name: name)
      end
      redirect_to plot_path(@plot), success: "作成しました！"
    else
      flash.now[:danger] = "作成できませんでした。"
      render :new
    end
  end
  
  def update
    @plot = current_user.plots.find(params[:id])
    if @plot.update(plot_params)
      redirect_to plot_path(@plot), success: "更新しました！"
    else
      redirect_to plot_path(@plot), success: "更新できませんでした。"
    end
  end

  def destroy
    @plot = current_user.plots.find(params[:id])
    @plot.destroy!
    redirect_to plots_path, status: :see_other, success: "削除しました！"
  end

  private

  def plot_params
    params.require(:plot).permit(:name, :theme, :one_line, :color)
  end

end
