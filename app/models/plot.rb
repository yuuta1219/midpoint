class Plot < ApplicationRecord
  belongs_to :user
  has_many  :eighteen_lines , dependent: :destroy
  has_many  :behind_the_scenes , dependent: :destroy
  has_many  :foreshadowings , dependent: :destroy
  has_many  :cards , dependent: :destroy
  has_many  :characters , dependent: :destroy
end
