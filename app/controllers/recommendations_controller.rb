class RecommendationsController < ApplicationController
  before_action :authenticate_user!

 

  # POST /recommendations or /recommendations.json
  def create
    @itinerary = Itinerary.find(params[:recommendation][:itinerary_id])
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.user = current_user

    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to itinerary_path(@itinerary.id), notice: "Recommendation was successfully created." }
      else
        format.html {  redirect_to  itinerary_path(@itinerary.id), alert: 'Comment was not created.'  }
      end
    end
  end


  private
   
    def recommendation_params
      params.require(:recommendation).permit(:content, :itinerary_id, :category => [])
    end
end
