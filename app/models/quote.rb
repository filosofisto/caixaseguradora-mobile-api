class Quote < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :category_properties
  has_and_belongs_to_many :coverages
  has_and_belongs_to_many :assistances
  has_and_belongs_to_many :assistance_packages
end
