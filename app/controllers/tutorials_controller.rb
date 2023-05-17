class TutorialsController < ApplicationController
  def complete
    current_user.update(tutorial_status: 2)
    redirect_to plots_path, notice: 'チュートリアルが完了しました。'
  end
  def start
    redirect_to plots_demos_path, notice: 'チュートリアルを開始しました。'
  end
end
