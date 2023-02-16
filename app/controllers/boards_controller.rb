class BoardsController < ApplicationController
  def index
    @current_page = "tab2"
    @plot = Plot.find(params[:plot_id])
  end
end
