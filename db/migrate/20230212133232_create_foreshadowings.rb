class CreateForeshadowings < ActiveRecord::Migration[7.0]
  def change
    create_table :foreshadowings do |t|
      t.string :name
      t.text :body
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
