class ItinerariesController < ApplicationController
  before_action :authenticate_user!

  before_action only: [:new, :create, :update, :destroy] do
    authorize_request(["normal_user", "admin"])
  end

  # GET /itineraries or /itineraries.json
  def index
    @itineraries = Itinerary.all
  end

  # GET /itineraries/1 or /itineraries/1.json
  def show
    @recommendation = Recommendation.new
    @itinerary = Itinerary.find(params[:id])

  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries or /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary = current_user.itineraries.build(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to itinerary_path(@itinerary), notice: "Itinerary was successfully created." }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1 or /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: "Itinerary was successfully updated." }
        format.json { render :show, status: :ok, location: @itinerary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1 or /itineraries/1.json
  def destroy
    @itinerary.destroy!

    respond_to do |format|
      format.html { redirect_to itineraries_path, status: :see_other, notice: "Itinerary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def itinerary_params
      params.require(:itinerary).permit(:name, :description, :star_date, :end_date)
    end
end
