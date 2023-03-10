class EighteenLine < ApplicationRecord
  belongs_to :plot

  validates :number, numericality: { only_integer: true }
  validates :name, length: { maximum: 255 }
  validates :explanation, length: { maximum: 255 }
  validates :explanation, length: { maximum: 255 }
  validates :body, length: { maximum: 255 }

end
