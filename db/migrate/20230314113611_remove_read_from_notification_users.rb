class RemoveReadFromNotificationUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :notification_users, :read, :boolean
  end
end
