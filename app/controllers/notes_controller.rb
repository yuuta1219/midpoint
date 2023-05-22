class NotesController < ApplicationController
  skip_before_action :require_login, only: [:index]
  before_action :plot_find, only: [:index, :create]
  before_action :note_and_plot_find, only: [:edit, :update, :destroy]
  before_action :check_plot_owner, only: [:edit]
  before_action :check_plot_accessibility, only: [:index]
  before_action :chat_ai

  def index
    @current_page = "tab7"
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def note_and_plot_find
    @note = Note.find(params[:id])
    @plot = @note.plot
  end
end
