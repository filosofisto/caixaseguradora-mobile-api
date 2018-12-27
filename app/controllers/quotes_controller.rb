class QuotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user, only: [:index, :create]
  before_action :set_quote, only: [:complete_quote]

  # GET /quotes
  def index
    @quotes = Quote.where(user_id: current_user.id)
    json_response(@quotes)
  end

  # POST /quotes
  def create
    copy_params = quote_params.dup
    copy_params[:user_id] = current_user.id

    ActiveRecord::Base.transaction do
      @quote = Quote.create!(copy_params.except(:category_properties))

      copy_params[:category_properties].each do |id|
        @quote.category_properties << CategoryProperty.find(id)
      end

      json_response(@quote, :created)
    end
  end

  # POST /quotes/complete
  def complete_quote
    ActiveRecord::Base.transaction do
      add_coverages_included
      add_coverages_selected
      add_assistances_included
      add_assistances_selected
      add_assistance_packages_selected
    end
  end

  private

  # Add coverages included
  def add_coverages_included
    Coverage.where(fix: true).each do |coverage|
      @quote.coverages << coverage
    end
  end

  # Add coverages selected
  def add_coverages_selected
    complete_quote_params[:coverages_selected].each do |id|
      coverage = Coverage.find(id)

      if !coverage.fix
        @quote.coverages << coverage
      end
    end
  end

  # Add assistances included
  def add_assistances_included
    Assistance.where(included: true).each do |assistance|
      @quote.assistances << assistance
    end
  end

  # Add assistance selected
  def add_assistances_selected
    complete_quote_params[:assistances_selected].each do |id|
      assistance = Assistance.find(id)

      if !assistance.included
        @quote.assistances << Assistance.find(id)
      end
    end
  end

  # Add assistance packages selected
  def add_assistance_packages_selected
    complete_quote_params[:assistance_packages_selected].each do |id|
      @quote.assistance_packages << AssistancePackage.find(id)
    end
  end

  def quote_params
    params.require(:quote).permit(:name, :email, :phone, :zipcode, :type_of_property, :gated_community,
                                  :main_home, :approximate_value, :insurance_with_another_insurer,
                                  :category_properties => [])
  end

  def complete_quote_params
    params.require(:quote).permit(:id, :calculate_for_years,
                                  :coverages_selected => [],
                                  :assistances_selected => [],
                                  :assistance_packages_selected => [])
  end

  def set_quote
    @quote = Quote.find(complete_quote_params[:id])
    raise 'Cota não pertence ao usuário' if @quote.user.id != current_user.id
  end
end
