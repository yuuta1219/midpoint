class ForeshadowingsController < ApplicationController
  before_action :set_foreshadowing, only: %i[ show edit update destroy ]

  # GET /foreshadowings or /foreshadowings.json
  def index
    @foreshadowings = Foreshadowing.all
  end

  # GET /foreshadowings/1 or /foreshadowings/1.json
  def show
  end

  # GET /foreshadowings/new
  def new
    @foreshadowing = Foreshadowing.new
  end

  # GET /foreshadowings/1/edit
  def edit
  end

  # POST /foreshadowings or /foreshadowings.json
  def create
    @foreshadowing = Foreshadowing.new(foreshadowing_params)

    respond_to do |format|
      if @foreshadowing.save
        format.html { redirect_to foreshadowing_url(@foreshadowing), notice: "Foreshadowing was successfully created." }
        format.json { render :show, status: :created, location: @foreshadowing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foreshadowing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foreshadowings/1 or /foreshadowings/1.json
  def update
    respond_to do |format|
      if @foreshadowing.update(foreshadowing_params)
        format.html { redirect_to foreshadowing_url(@foreshadowing), notice: "Foreshadowing was successfully updated." }
        format.json { render :show, status: :ok, location: @foreshadowing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foreshadowing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foreshadowings/1 or /foreshadowings/1.json
  def destroy
    @foreshadowing.destroy

    respond_to do |format|
      format.html { redirect_to foreshadowings_url, notice: "Foreshadowing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foreshadowing
      @foreshadowing = Foreshadowing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foreshadowing_params
      params.fetch(:foreshadowing, {})
    end
end
