class VegetablesController < ApplicationController
  before_action :set_vegetable, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  add_breadcrumb "Mes légumes", :vegetables_path

  # GET /vegetables
  # GET /vegetables.json
  def index
    @vegetables = Vegetable.where(user: current_user)
  end

  # GET /vegetables/1
  # GET /vegetables/1.json
  def show
    add_breadcrumb "Voir un légume"
  end

  # GET /vegetables/new
  def new
    @vegetable = Vegetable.new
    add_breadcrumb "Ajouter un légume"
  end

  # GET /vegetables/1/edit
  def edit
    add_breadcrumb "Modifier un légume"
  end

  # POST /vegetables
  # POST /vegetables.json
  def create
    @vegetable = Vegetable.new(vegetable_params)
    @vegetable.user = current_user

    respond_to do |format|
      if @vegetable.save
        format.html { redirect_to @vegetable, notice: 'Votre légume a été ajouté avec succès.' }
        format.json { render :show, status: :created, location: @vegetable }
      else
        format.html { render :new }
        format.json { render json: @vegetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vegetables/1
  # PATCH/PUT /vegetables/1.json
  def update
    respond_to do |format|
      if @vegetable.update(vegetable_params)
        format.html { redirect_to @vegetable, notice: 'Votre légume a été mis à jour.' }
        format.json { render :show, status: :ok, location: @vegetable }
      else
        format.html { render :edit }
        format.json { render json: @vegetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vegetables/1
  # DELETE /vegetables/1.json
  def destroy
    @vegetable.destroy
    respond_to do |format|
      format.html { redirect_to vegetables_url, notice: 'Votre légume a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vegetable
      @vegetable = Vegetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vegetable_params
      params.require(:vegetable).permit(:name, :user_id)
    end
end
