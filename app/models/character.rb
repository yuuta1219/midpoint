class Character < ApplicationRecord
  mount_uploader :avatar, PictureUploader

  belongs_to :plot

  has_many  :character_knows , dependent: :destroy
  has_many  :card, through: :character_knows

  validates :name, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }
  validates :appearance, length: { maximum: 65_535 }
  validates :occupation, length: { maximum: 255 }
  validates :personality, length: { maximum: 65_535 }
  validates :motivation, length: { maximum: 65_535 }
  validates :relationship, length: { maximum: 65_535 }
  validates :role, length: { maximum: 255 }
end
