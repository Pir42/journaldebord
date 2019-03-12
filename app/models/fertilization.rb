class Fertilization < ApplicationRecord
  belongs_to :fertilizer
  belongs_to :parcel
  belongs_to :user
end
