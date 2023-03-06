class Card < ApplicationRecord
  belongs_to :plot
  has_many  :foreshadowing_cards, dependent: :destroy
  has_many  :foreshadowings, through: :foreshadowing_cards 
  has_many  :character_knows, dependent: :destroy
  has_many  :characters, through: :character_knows
  
  enum scene_type: { explicit: 0, implicit: 1}

end
