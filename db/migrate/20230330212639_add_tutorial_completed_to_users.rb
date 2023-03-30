class AddTutorialCompletedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tutorial_completed, :boolean
  end
end
