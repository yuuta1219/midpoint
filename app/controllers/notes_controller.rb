class NotesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :plot_find, only: [:index, :create]
  before_action :note_and_plot_find, only: [:show, :edit, :update, :destroy]
  before_action :check_plot_owner, only: [:edit]
  before_action :check_plot_accessibility, only: [:index, :show]
  before_action :chat_ai

  def index
    @current_page = "tab6"
    @current_note = @plot.notes.order(:created_at).pluck(:id).first
    @notes = @plot.notes.order(:created_at)
    @note = @plot.notes.order(:created_at).first
  end

  def show
    @current_page = "tab6"
    @current_note = @note.id
    @notes = @plot.notes.order(:created_at)
  end

  def create
    @note = @plot.notes.create(title: "メモ", content: "" )
    if @note.save
      redirect_to note_path(@note)
    else
      render :index
    end
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
