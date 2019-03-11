class Event < ApplicationRecord
  belongs_to :user
  has_one :variety
  has_one :parcel
  has_one :action_type
end
