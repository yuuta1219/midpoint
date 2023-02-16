class BoardsController < ApplicationController
  def index
    @plot = Plot.find(params[:plot_id])
  end
end
