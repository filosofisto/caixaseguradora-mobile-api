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

  # PATCH /quotes/complete
  def complete_quote
    ActiveRecord::Base.transaction do
      remove_all_coverages
      add_coverages_included
      add_coverages_selected

      remove_all_assistances
      add_assistances_included
      add_assistances_selected

      remove_all_assistance_packages
      add_assistance_packages_selected

      calculate_total

      json_response(@quote, :ok)
    end
  end

  private

  def calculate_total
    total = total_coverages + total_assistance_packages

    @quote.calculate_for_years = complete_quote_params[:calculate_for_years]
    @quote.total = total
    @quote.save!
  end

  def total_coverages
    tot = 0.0

    @quote.coverages.each do |coverage|
      tot += coverage.value
    end

    tot
  end

  def total_assistance_packages
    tot = 0.0

    @quote.assistance_packages.each do |assistance_package|
      tot += assistance_package.value
    end

    tot
  end

  # Remove all coverages of this quote
  def remove_all_coverages
    @quote.coverages.destroy_all
  end

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

  # Remove all asistances of this quote
  def remove_all_assistances
    @quote.assistances.destroy_all
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

  # Remove all assistance packages of this quote
  def remove_all_assistance_packages
    @quote.assistance_packages.destroy_all
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
