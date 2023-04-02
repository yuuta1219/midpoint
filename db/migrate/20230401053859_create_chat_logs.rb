class CreateChatLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.text :input
      t.text :output

      t.timestamps
    end
  end
end
