class FertilizersController < ApplicationController
  before_action :set_fertilizer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  add_breadcrumb "Mes engrais", :fertilizers_path
  # GET /fertilizers
  # GET /fertilizers.json
  def index
    @fertilizers = Fertilizer.where(user: current_user)
  end

  # GET /fertilizers/1
  # GET /fertilizers/1.json
  def show
    add_breadcrumb "Voir mes engrais"
  end

  # GET /fertilizers/new
  def new
    @fertilizer = Fertilizer.new
    add_breadcrumb "Nouvel engrais"
  end

  # GET /fertilizers/1/edit
  def edit
    add_breadcrumb "Modifier mes engrais"
  end

  # POST /fertilizers
  # POST /fertilizers.json
  def create
    @fertilizer = Fertilizer.new(fertilizer_params)
    @fertilizer.user = current_user

    respond_to do |format|
      if @fertilizer.save
        format.html { redirect_to @fertilizer, notice: 'Fertilizer was successfully created.' }
        format.json { render :show, status: :created, location: @fertilizer }
      else
        format.html { render :new }
        format.json { render json: @fertilizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fertilizers/1
  # PATCH/PUT /fertilizers/1.json
  def update
    respond_to do |format|
      if @fertilizer.update(fertilizer_params)
        format.html { redirect_to @fertilizer, notice: 'Fertilizer was successfully updated.' }
        format.json { render :show, status: :ok, location: @fertilizer }
      else
        format.html { render :edit }
        format.json { render json: @fertilizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fertilizers/1
  # DELETE /fertilizers/1.json
  def destroy
    @fertilizer.destroy
    respond_to do |format|
      format.html { redirect_to fertilizers_url, notice: 'Fertilizer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fertilizer
      @fertilizer = Fertilizer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fertilizer_params
      params.require(:fertilizer).permit(:name, :nitrogen, :phosphorus, :potassium, :supplier, :details, :user_id)
    end
end
