class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  
  has_many  :plots , dependent: :destroy
  has_many  :notification_users, dependent: :destroy
  has_many :chat_logs, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  enum role: { general: 0, admin: 1, guest: 2}
  enum tutorial_status: { not_started: 0, running: 1, completed: 2 }

  def own?(object)
    id == object.user_id
  end
end