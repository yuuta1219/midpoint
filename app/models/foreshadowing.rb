class Foreshadowing < ApplicationRecord
  belongs_to :plot
  has_many  :foreshadowing_cards, dependent: :destroy
  has_many  :card, through: :foreshadowing_cards

  validates :name, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535}

end
