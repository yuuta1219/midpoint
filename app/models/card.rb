class Card < ApplicationRecord
  belongs_to :plot
  has_many  :foreshadowing_cards, dependent: :destroy
  has_many  :foreshadowings, through: :foreshadowing_cards 
  has_many  :character_knows, dependent: :destroy
  has_many  :characters, through: :character_knows

  validates :scene, numericality: { only_integer: true }
  validates :current_location, length: { maximum: 255 }
  validates :point_of_view, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }
  validates :title, length: { maximum: 255 }
  
  enum scene_type: { explicit: 0, implicit: 1}

end
