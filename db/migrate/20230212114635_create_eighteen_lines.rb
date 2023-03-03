class CreateEighteenLines < ActiveRecord::Migration[7.0]
  def change
    create_table :eighteen_lines do |t|
      t.integer :number
      t.string :name
      t.string :explanation
      t.string :body
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
