class Plot < ApplicationRecord
  belongs_to :user
  has_many  :eighteen_lines, dependent: :destroy
  has_many  :foreshadowings, dependent: :destroy
  has_many  :cards, dependent: :destroy
  has_many  :characters, dependent: :destroy

  validates :name, length: { maximum: 255 }
  validates :theme, length: { maximum: 255 }
  validates :one_line, length: { maximum: 255 }

  enum color: { ホワイト: 0, ブルー: 1, オレンジ: 2, ピンク: 3, グリーン: 4, グレイ: 5 }
  enum length_type: { '長編': 0, '中編': 1, '短編': 2, '超短編' }
  enum person: { '一人称': 0, '二人称': 1, '三人称': 2 }
  enum accessibility: { plot_private: 0, plot_public: 1 }

  extend FriendlyId
  friendly_id :generate_slug, use: :slugged

  def generate_slug
    SecureRandom.hex(10)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "theme", "one_line", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
