class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Suivis des traitements", :treatments_path

  # GET /treatments
  # GET /treatments.json
  def index
    @treatments = Treatment.where(user: current_user).page(params[:page]).per(12)

    if (params[:from] != '' && params[:to] != '') && (params[:from] != nil && params[:to] != nil)
      @treatments = @treatments.where("date >= :start_date AND date <= :end_date",
        {start_date: params[:from], end_date: params[:to]})

    elsif params[:from] != '' && params[:to] == ''
      @treatments = @treatments.where("date >= :start_date", 
        {start_date: params[:from]})

    elsif params[:from] == '' && params[:to] != ''
      @treatments = @treatments.where("date <= :end_date", 
        {end_date: params[:to]})
    end

    if params[:variety] != nil
      params[:variety][:id].each do |id|
        if id != ''
          @treatments.each do |event|
            @treatments.where("variety_id = :varietyid", 
            {varietyid: id.to_i})
          end 
        end
      end
    end

    if params[:parcel] != nil
      params[:parcel][:id].each do |id|
        if id != ''
          @treatments.each do |event|
            @treatments = @treatments.where("parcel_id = :parcelid", 
              {parcelid: id.to_i})
          end
        end
      end
    end

  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show
    add_breadcrumb 'Consulter un suivi', treatment_path
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
    add_breadcrumb 'Ajouter un suivi', new_treatment_path
  end

  # GET /treatments/1/edit
  def edit
    add_breadcrumb 'Modifier un suivi', edit_treatment_path
  end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.user = current_user

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to @treatment, notice: 'Treatment was successfully created.' }
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: 'Treatment was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, notice: 'Treatment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_params
      params.require(:treatment).permit(:date, :variety_id, :details, :quantity, :unit, :parcel_id, :user_id)
    end
end
