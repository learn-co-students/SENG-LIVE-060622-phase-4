class User < ApplicationRecord
  has_many :tickets # .tickets
  has_many :productions, through: :tickets
end
