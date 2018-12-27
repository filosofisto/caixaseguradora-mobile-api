class Assistance < ApplicationRecord
  has_and_belongs_to_many :assistance_packages
end
