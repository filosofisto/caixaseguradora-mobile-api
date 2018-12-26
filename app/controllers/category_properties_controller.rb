class CategoryPropertiesController < ApplicationController

  # GET /category_properties
  def index
    @category_properties = CategoryProperty.order(:name)
    json_response(@category_properties)
  end

end
