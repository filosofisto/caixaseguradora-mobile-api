class AssistancePackage < ApplicationRecord
  has_and_belongs_to_many :assistances
  has_and_belongs_to_many :quotes
end
