class AssistancesController < ApplicationController

  # GET /assistances
  def index
    @assistances = Assistance.order(:name)
    json_response(@assistances)
  end
end
