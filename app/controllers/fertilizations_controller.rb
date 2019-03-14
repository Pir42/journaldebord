class FertilizationsController < ApplicationController
  before_action :set_fertilization, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  add_breadcrumb "Suivis de la fertilisation", :fertilizations_path

  # GET /fertilizations
  # GET /fertilizations.json
  def index
    @fertilizations = Fertilization.where(user: current_user)

    if (params[:from] != '' && params[:to] != '') && (params[:from] != nil && params[:to] != nil)
      @fertilizations = @fertilizations.where("date >= :start_date AND date <= :end_date",
        {start_date: params[:from], end_date: params[:to]})

    elsif params[:from] != '' && params[:to] == ''
      @fertilizations = @fertilizations.where("date >= :start_date", 
        {start_date: params[:from]})

    elsif params[:from] == '' && params[:to] != ''
      @fertilizations = @fertilizations.where("date <= :end_date", 
        {end_date: params[:to]})
    end

    if params[:fertilizer] != nil
      @fertilizerid = params[:fertilizer]
      @fertilizerid = @fertilizerid[:id]
      if @fertilizerid != ''
        @fertilizations = @fertilizations.where("fertilizer_id = :fertilizerid", 
          {fertilizerid: @fertilizerid.to_i})
      end
    end

  end

  # GET /fertilizations/1
  # GET /fertilizations/1.json
  def show
    add_breadcrumb 'Consulter un suivi', fertilization_path
  end

  # GET /fertilizations/new
  def new
    @fertilization = Fertilization.new
    add_breadcrumb 'Ajouter un suivi', new_fertilization_path
  end

  # GET /fertilizations/1/edit
  def edit
    add_breadcrumb 'Modifier un suivi', edit_fertilization_path
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
