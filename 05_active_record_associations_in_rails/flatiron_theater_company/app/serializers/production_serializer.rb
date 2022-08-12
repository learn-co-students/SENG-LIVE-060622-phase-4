class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :genre, :director, :ongoing, :budget, :image, :title
  has_many :cast_members

  def ongoing 
    # if ongoing is true show "currently showing"
    # if ongoing is false show "not showing"
    self.object.ongoing ? "Currently Showing" : "Not Showing"
  end
end
