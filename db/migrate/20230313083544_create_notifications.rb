class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
