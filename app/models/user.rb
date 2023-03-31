class User < ApplicationRecord
  authenticates_with_sorcery!
  
  has_many  :plots , dependent: :destroy
  has_many  :notification_users, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  enum role: { general: 0, admin: 1, guest: 2 }
  enum tutorial_status: { not_started: 0, running: 1, completed: 2 }

  def self.create_guest
    user = create(name: "ゲストユーザー", email: "guest-#{SecureRandom.hex(8)}@example.com", password: "1234", password_confirmation: "1234", role: :guest, tutorial_status: :not_started)
    Rails.logger.info user.errors.full_messages if user.errors.any?
    user
  end

  def guest?
    role == "guest"
  end

  def own?(object)
    id == object.user_id
  end
end