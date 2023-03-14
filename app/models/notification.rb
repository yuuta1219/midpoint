class Notification < ApplicationRecord
  has_many  :notification_users, dependent: :destroy
end
