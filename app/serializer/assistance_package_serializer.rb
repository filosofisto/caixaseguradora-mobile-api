class AssistancePackageSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :assistances, :created_at, :updated_at
end
