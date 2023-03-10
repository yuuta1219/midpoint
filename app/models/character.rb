class Character < ApplicationRecord
  belongs_to :plot
  has_many  :character_knows , dependent: :destroy
  has_many  :card, through: :character_knows

  validates :name, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }
  
end
