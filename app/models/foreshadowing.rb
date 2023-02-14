class Foreshadowing < ApplicationRecord
  belongs_to :plot
  has_many  :foreshadowing_cards, dependent: :destroy
  has_many  :card, through: :foreshadowing_cards
end
