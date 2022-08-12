class TicketSerializer < ActiveModel::Serializer
  attributes :id, :price 
  has_one :production

  def price 
    "$ #{self.object.price}"
  end
end


# users => tickets => production