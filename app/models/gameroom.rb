class Gameroom < ApplicationRecord
  belongs_to :user
  has_many :blue_cards
  has_many :white_cards
  validates :password, uniqueness: true
end
