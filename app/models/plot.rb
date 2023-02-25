class Plot < ApplicationRecord
  belongs_to :user
  has_many  :eighteen_lines , dependent: :destroy
  has_many  :behind_the_scenes , dependent: :destroy
  has_many  :foreshadowings , dependent: :destroy
  has_many  :cards , dependent: :destroy
  has_many  :characters , dependent: :destroy

  enum color: { バニラ: 0, ブルー: 1, オレンジ: 2, ピンク: 3, グリーン: 4, グレイ: 5 }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "theme", "one_line", "memo", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
