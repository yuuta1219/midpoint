class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :scene
      t.integer :time
      t.string :current_location
      t.string :point_of_view
      t.integer :emotional_value
      t.text :body
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
