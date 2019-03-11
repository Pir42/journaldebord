class Event < ApplicationRecord
  belongs_to :user
  has_one :variety
  has_one :parcel
end
