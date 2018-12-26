class QuotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user, only: [:create]

  # POST /quotes
  def create
    copy_params = quote_params.dup
    copy_params[:user_id] = current_user.id

    ActiveRecord::Base.transaction do
      @quote = Quote.create!(copy_params)

      copy_params[:category_properties].each do |id|
        @quote.category_properties.create!({quote_id: @quote.id, category_property_id: id})
      end

      json_response(@quote, :created)
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:name, :email, :phone, :zipcode, :type_of_property, :gated_community,
                                  :main_home, :approximate_value, :insurance_with_another_insurer,
                                  :category_properties => [])
  end
end
