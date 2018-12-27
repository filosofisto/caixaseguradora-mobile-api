class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :zipcode, :type_of_property, :gated_community, :main_home,
             :approximate_value, :insurance_with_another_insurer, :user_id, :category_properties,
             :calculate_for_years, :coverages, :assistances, :assistance_packages, :total,
             :created_at, :updated_at
end
