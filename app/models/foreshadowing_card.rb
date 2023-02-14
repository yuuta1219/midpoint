class ForeshadowingCard < ApplicationRecord
  belongs_to :card
  belongs_to :foreshadowing

  enum status: { start: 0, end: 1 }
end
