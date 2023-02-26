class CreatePlots < ActiveRecord::Migration[7.0]
  def change
    create_table :plots do |t|
      t.string :name
      t.string :theme
      t.string :one_line
      t.integer :color, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
