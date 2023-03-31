class AddTutorialCompletedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tutorial_status, :integer, default: 0
  end
end
