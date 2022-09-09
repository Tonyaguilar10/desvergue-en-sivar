class Gameroom < ApplicationRecord
  belongs_to :user
  validates :password, uniqueness: true
end
