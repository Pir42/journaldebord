class Treatment < ApplicationRecord
  belongs_to :variety
  belongs_to :parcel
  belongs_to :user
end
