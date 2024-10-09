class RecommendationsController < ApplicationController
  before_action :authenticate_user!

 

  # POST /recommendations or /recommendations.json
  def create
    @itinerary = Itinerary.find(params[:recomendation][:itinerary_id])
    @recomendation = Recommendation.new(recomendation_params)
    @recomendation.user = current_user

    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to itinerary_path(@itinerary_id), notice: "Recommendation was successfully created." }
      else
        format.html {  redirect_to  itinerary_path(@itinerary_id), alert: 'Comment was not created.'  }
      end
    end
  end


  private
   
    def recommendation_params
      params.require(:recommendation).permit(:content, :category => [])
    end
end
