class OutreachesController < ApplicationController
  def create
    @outreach = Outreach.new(
                              lead_id: params[:lead_id],
                              text: params[:text]
                            )
    if @outreach.save
      render json: {message: "Outreach created"}
    else
      render json: {message: "Outreach unsuccessfull"}
    end
  end
end
