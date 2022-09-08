class Hand < ApplicationRecord
  belongs_to :user
  belongs_to :gameroom
  belongs_to :white_card
end
