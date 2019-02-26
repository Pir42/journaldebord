class Variety < ApplicationRecord
  belongs_to :vegetable
  belongs_to :user
end
