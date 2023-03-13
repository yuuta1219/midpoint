class CreateNotificationUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :notification_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notification, null: false, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
