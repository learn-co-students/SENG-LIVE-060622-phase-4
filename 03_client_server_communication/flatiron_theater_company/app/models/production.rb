class Production < ApplicationRecord
  validates :title, presence: true
  validates :budget, numericality: {greater_than: 0}


  # .new 
  # .save 
  # .create 

  # production.errors
  # production.errors.full_messages
  # => ["Title can't be blank", "Budget is not a number"] 
end
