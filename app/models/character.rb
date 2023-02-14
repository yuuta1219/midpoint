class Character < ApplicationRecord
  belongs_to :plot
  has_many  :character_knows , dependent: :destroy
  has_many  :card, through: :character_knows
end
