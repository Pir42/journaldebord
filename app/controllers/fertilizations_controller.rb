class FertilizationsController < ApplicationController
  before_action :set_fertilization, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /fertilizations
  # GET /fertilizations.json
  def index
    @fertilizations = Fertilization.where(user: current_user)
  end

  # GET /fertilizations/1
  # GET /fertilizations/1.json
  def show
  end

  # GET /fertilizations/new
  def new
    @fertilization = Fertilization.new
  end

  # GET /fertilizations/1/edit
  def edit
  end

  # POST /fertilizations
  # POST /fertilizations.json
  def create
    @fertilization = Fertilization.new(fertilization_params)
    @fertilization.user = current_user

    respond_to do |format|
      if @fertilization.save
        format.html { redirect_to @fertilization, notice: 'Votre suivi de fertilisation a été ajouté avec succès.' }
        format.json { render :show, status: :created, location: @fertilization }
      else
        format.html { render :new }
        format.json { render json: @fertilization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fertilizations/1
  # PATCH/PUT /fertilizations/1.json
  def update
    respond_to do |format|
      if @fertilization.update(fertilization_params)
        format.html { redirect_to @fertilization, notice: 'Votre suivi de fertilisation a été mis à jour.' }
        format.json { render :show, status: :ok, location: @fertilization }
      else
        format.html { render :edit }
        format.json { render json: @fertilization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fertilizations/1
  # DELETE /fertilizations/1.json
  def destroy
    @fertilization.destroy
    respond_to do |format|
      format.html { redirect_to fertilizations_url, notice: 'Votre suivi de fertilisation a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fertilization
      @fertilization = Fertilization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fertilization_params
      params.require(:fertilization).permit(:date, :fertilizer_id, :quantity, :parcel_id, :user_id)
    end
end