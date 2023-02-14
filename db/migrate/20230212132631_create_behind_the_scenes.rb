class CreateBehindTheScenes < ActiveRecord::Migration[7.0]
  def change
    create_table :behind_the_scenes do |t|
      t.string :name
      t.integer :time
      t.text :body
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
