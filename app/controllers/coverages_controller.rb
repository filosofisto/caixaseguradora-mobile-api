class CoveragesController < ApplicationController

  # GET /coverages
  def index
    @coverages = Coverage.order(:name)
    json_response(@coverages)
  end
end
