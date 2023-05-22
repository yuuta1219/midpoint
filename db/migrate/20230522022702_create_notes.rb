class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
