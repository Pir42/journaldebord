class Vegetable < ApplicationRecord
  belongs_to :user
  has_many :varieties
end
