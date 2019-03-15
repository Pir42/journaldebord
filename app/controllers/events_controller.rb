class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  add_breadcrumb "Suivis de mes cultures", :events_path

  # GET /events
  # GET /events.json
  def index
    @events = Event.where(user: current_user).page(params[:page]).per(12)

    if (params[:from] != '' && params[:to] != '') && (params[:from] != nil && params[:to] != nil)
      @events = @events.where("date >= :start_date AND date <= :end_date",
        {start_date: params[:from], end_date: params[:to]})

    elsif params[:from] != '' && params[:to] == ''
      @events = @events.where("date >= :start_date", 
        {start_date: params[:from]})


    elsif params[:from] == '' && params[:to] != ''
      @events = @events.where("date <= :end_date", 
        {end_date: params[:to]})
    end

    if params[:variety] != nil
      params[:variety][:id].each do |id|
        if id != ''
          @events.each do |event|
            @events.where("variety_id = :varietyid", 
            {varietyid: id.to_i})
          end 
        end
      end
    end

    if params[:vegetable] != nil
      params[:vegetable][:id].each do |id|
        if id != ''
          @events.each do |event|
            @events.where("vegetable_id = :vegetableid", 
            {vegetableid: id.to_i})
          end 
        end
      end
    end

    if params[:action_type] != nil
      params[:action_type][:id].each do |id|
        if id != ''
          @events.each do |event|
            @events = @events.where("action_type_id = :actionid", 
              {actionid: id.to_i})
          end
        end
      end
    end

    if params[:parcel] != nil
      params[:parcel][:id].each do |id|
        if id != ''
          @events.each do |event|
            @events = @events.where("parcel_id = :parcelid", 
              {parcelid: id.to_i})
          end
        end
      end
    end


  end

  # GET /events/1
  # GET /events/1.json
  def show
    add_breadcrumb 'Consulter un suivi'
  end

  # GET /events/new
  def new
    @event = Event.new
    add_breadcrumb 'Ajouter un suivi'
  end

  # GET /events/1/edit
  def edit
    add_breadcrumb 'Modifier un suivi'
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Votre suivi a été ajouté avec succès.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Votre suivi a été mis à jour.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Votre suivi a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :variety_id, :parcel_id, :action_type_id, :details, :user_id, :quantity, :unit)
    end
end
