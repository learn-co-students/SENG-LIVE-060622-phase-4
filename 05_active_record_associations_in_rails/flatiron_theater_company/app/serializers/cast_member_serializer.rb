class CastMemberSerializer < ActiveModel::Serializer
  attributes :id, :role, :name

  has_one :production
end
