class AddTutorialCompletedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tutorial_completed, :boolean
    
    User.where(tutorial_completed: nil).update_all(tutorial_completed: false)
  end
end
