class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :vegetables
  has_many :parcels
  has_many :fertilizers
  has_many :treatments
  has_many :varieties
  has_many :vegetables
  has_many :action_types

  attr_accessor :login
end
