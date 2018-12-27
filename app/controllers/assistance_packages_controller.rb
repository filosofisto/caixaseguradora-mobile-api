class AssistancePackagesController < ApplicationController

  # GET /assistance_packages
  def index
    @assistance_packages = AssistancePackage.order(:name)
    json_response(@assistance_packages)
  end
end
