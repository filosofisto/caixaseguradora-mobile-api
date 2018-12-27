class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :last_login, :created_at, :updated_at
end
