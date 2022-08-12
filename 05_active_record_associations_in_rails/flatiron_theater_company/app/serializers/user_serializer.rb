class UserSerializer < ActiveModel::Serializer
  attributes :id, :name 
  has_many :tickets, include: ["tickets", "tickets.production"]
end
